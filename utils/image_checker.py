import argparse
import enum
import filecmp
import logging
import imghdr
import sys
from collections import namedtuple
from pathlib import Path
from typing import List

import cv2
import mmh3
import numpy as np

MMH3HASH = mmh3.hash128


class RegisterCode(enum.Enum):
    READ_FAIL = "unable to read the image"
    DECODE_FAIL = "unable to decode the image"
    DUPLICATE = "both id and content already in container"
    ID_CONFLICT = "id conflict"
    CONTENT_CONFLICT = "content conflict"
    SUCCESS = "success"


class RegisterResult(namedtuple("RegisterResult", ["code", "info"])):

    __slots__ = ()

    def __new__(cls, code: RegisterCode, info: str):
        """Information of a single register into ImageContainer

        Args:
            code (RegisterCode): the result of register
            info (str): extra information on register
        """
        if not isinstance(code, RegisterCode):
            raise TypeError("Code must be one of RegisterCode")
        return super().__new__(cls, code, str(info))


class ImageContainer:

    def __init__(self, hash_func=MMH3HASH, check_corrupted: bool=True):
        """A class for checking duplicate image content

        Args:
            hash_func (bool):
                the hash function for checking the image
            check_corrupted:
                if the container will reject invalid/corrupted images
        """
        # a simple str -> int mapping
        self._id_to_hash = {}
        # a mapping of int -> list of tuple (image id, image path)
        # one hash may map to list of images if hash-collisions happens
        self._hash_to_id = {}
        self._hash = hash_func
        self._check_corrupted = check_corrupted

    def search_image_hash(self, image_id: str) -> int:
        """Get the registered hash value of an image id, None if not found"""
        return self._id_to_hash.get(image_id)

    def search_image_id(self, image_path: str) -> str:
        """Return the registered image id of an image content

        This function will match image by content and content only

        Return:
            A tuple of (image id(s), image path(s), hash value)
            if no registered image found, image id and path will be none.

            hash value is always returned.

        Raises:
            EnvironmentError if the image_path is not readable;
            ValueError for corrupted images if check_corrupted is set True.
        """
        try:
            with open(image_path, "rb") as f:
                content = f.read()
                if self._check_corrupted:
                    nparr = np.frombuffer(content, np.uint8)
                    img_np = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
                    if img_np is None:
                        msg = "Decode image {} failed".format(image_path)
                        raise ValueError(msg)
        except EnvironmentError as err:
            raise EnvironmentError("Load image {} failed".format(image_path))

        hash_value = self._hash(content)

        hash_check = self._hash_to_id.get(hash_value, [])
        for image_id, path in hash_check:
            if filecmp.cmp(image_path, path):
                registered_id = image_id
                registered_path = path
                break
        else:
            registered_id = None
            registered_path = None

        return registered_id, registered_path, hash_value

    def register_image(self, image_id: str, image_path: str) -> RegisterResult:
        """Add an image into container

        Args:
            image_id (str):
                the the unique identifier of the image
            image_path (str):
                the path of image, whose byte string will be hashed
                to check if there is duplicated image.

        Returns:
            A RegisterResult enum, with:
                READ_FAIL = unable to read the image
                DECODE_FAIL = unable to decode the image
                DUPLICATE = both id and content are duplicate
                ID_CONFLICT = image id is duplicate
                CONTENT_CONFLICT = image content is duplicate
                SUCCESS = image is successfully added
        """
        # check if image content/id existed, check hash value first,
        # compare image bytes if collision
        stored_hash = self.search_image_hash(image_id)
        try:
            stored_id, stored_path, v_hash = self.search_image_id(image_path)
        except ValueError as err:
            return RegisterResult(code=RegisterCode.DECODE_FAIL, info=str(err))
        except EnvironmentError as err:
            return RegisterResult(code=RegisterCode.READ_FAIL, info=str(err))

        # handle conflict
        if stored_id and stored_hash:
            msg = "Duplicate image: id {} and hash: {}"
            return RegisterResult(
                code=RegisterCode.DUPLICATE,
                info=msg.format(stored_id, stored_hash)
            )

        if stored_id:
            msg = "Content of ID {} conflict with registered id {}, path: {}"
            return RegisterResult(
                code=RegisterCode.CONTENT_CONFLICT,
                info=msg.format(image_id, stored_id, stored_path)
            )

        if stored_hash:
            msg = "ID conflict: {}, with content hash: {}"
            return RegisterResult(
                code=RegisterCode.ID_CONFLICT,
                info=msg.format(image_id, stored_hash)
            )

        # Register image into dicationary
        self._id_to_hash[image_id] = v_hash
        if stored_id:
            stored_id.append((image_id, image_path))
        else:
            self._hash_to_id[v_hash] = [(image_id, image_path)]

        return RegisterResult(
                code=RegisterCode.SUCCESS,
                info="Successfully register id " + image_id
            )


def rglob_imgs(dirs: List[Path]) -> Path:
    if isinstance(dirs, (str, Path)):
        dirs = [Path(dirs)]

    for directory in dirs:
        target = Path(directory)
        if not target.is_dir():
            print("Warning: {} is not valid dir".format(directory))
            continue
        for file in target.rglob("*.*"):
            if imghdr.what(str(file)) is not None:
                yield file


class ProgressBar:

    FMT = "{}/{} [{}]"
    BAR_LENGTH = 50

    def __init__(self, total: int):
        self.total = total
        self.current = 0

    def advanced(self, step: int):
        if self.current + step > self.total:
            raise ValueError("Progress Bar step exceeded.")
        self.current += step
        bl = self.BAR_LENGTH
        pa = int(bl * self.current/self.total)

        progress = self.FMT.format(self.current, self.total, "{}")
        bar = "=" * (pa - 1) + (">" if (bl - pa) else "=") + "." * (bl - pa)
        progress = progress.format(bar)
        sys.stdout.write("\r")
        sys.stdout.write(progress)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "directories", nargs="+",
        help="One or more directories. All image files inside will be checked."
    )
    parser.add_argument(
        "--ignore-name",
        help="to check only image content",
        action="store_true"
    )
    args = parser.parse_args()

    # check only repeated, ignore filename
    print("-- Globbing images --")
    files = list(rglob_imgs(args.directories))
    if not files:
        print("Image check failed. No image found under:")
        for img in args.directories:
            print(img)
        sys.exit(1)
    print("-- Globbing finished. {} images found --".format(len(files)))

    container = ImageContainer()
    progress = ProgressBar(total=len(files))
    index = 1
    failed = []
    for img in files:
        img_id = str(index) if args.ignore_name else img.stem
        image_path = str(img)
        result = container.register_image(img_id, image_path)
        if result.code != RegisterCode.SUCCESS:
            msg = "Image check failed: {} for file {}"
            failed.append(msg.format(result.info, image_path))

        progress.advanced(1)
        index += 1

    if failed:
        for fail in failed:
            print(fail)
        sys.exit(1)
    else:
        print("{} image(s) successfully registered.".format(len(files)))
