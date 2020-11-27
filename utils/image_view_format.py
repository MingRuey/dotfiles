import sys
import argparse
import imghdr
from typing import List
from pathlib import Path


def glob_imgs(dirs: List[Path], recursive=False) -> Path:
    if isinstance(dirs, (str, Path)):
        dirs = [Path(dirs)]

    for directory in dirs:
        target = Path(directory)
        if not target.is_dir():
            print("Warning: {} is not valid dir".format(directory))
            continue
        
        target = target.rglob("*.*") if recursive else target.glob("*.*")
        for file in target:
            if not file.is_file():
                continue

            imgfmt = imghdr.what(str(file))
            if imgfmt is not None:
                yield file, imgfmt


def is_suffix_right(file: Path, extension: str):
    """Check if image file extension match 'ext'"""
    ext = extension.lower()
    fext = file.suffix.lower()[1:]
    jpgs = {"jpg", "jpeg"}
    if fext in jpgs and ext in jpgs:
        return True
    elif fext == ext:
        return True
    return False


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "-r", "--recursive", action="store_true",
        help="To do the check recursively"
    )   
    parser.add_argument(
        "directories", nargs="+",
        help="One or more directories, All image files inside will be checked"
    )
    args = parser.parse_args()

    files = list(glob_imgs(args.directories, args.recursive))
    if not files:
        print("--no image found.")
        sys.exit(1)

    for file, imgfmt in files:
        if not is_suffix_right(file, imgfmt):
            msg = "[Error] {}: Actual {}".format(file.name, imgfmt)
        else:
            msg = "[Pass] {}".format(file.name)
        print(msg)

