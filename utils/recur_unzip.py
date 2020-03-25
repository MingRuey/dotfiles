import sys
import argparse
import zipfile
from pathlib import Path


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="unzip files in dir")
    parser.add_argument(
        "dir", type=Path, nargs="?", default=".",
        help="target directory, where all *.zip files will be unzip"
    )
    parser.add_argument(
        "-d",  "--delete", action="store_true",
        help="delete zip file after unzip"
    )

    args = parser.parse_args()

    directory = args.dir
    if not directory.is_dir():
        sys.exit("Invalid directory {}".format(directory))

    files = list(directory.glob("*.zip"))
    if not files:
        sys.exit(".zip file not found.")

    for file in files:
        # create target directory
        target_dir = directory.joinpath(file.stem)
        try:
            target_dir.mkdir(exist_ok=False)
        except FileExistsError:
            print("Directory {} already exist".format(target_dir))

        try:
            with zipfile.ZipFile(str(file), "r") as f:
                f.extractall(str(target_dir))
        except Exception as err:
            print("Failed to extract {}, {}".format(file, err))
        else:
            if args.delete:
                file.unlink()
