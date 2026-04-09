from pathlib import Path
from argparse import ArgumentParser
import shutil

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("source", help="Source file")
    parser.add_argument("name", help="Destination directory name")
    parser.add_argument("--remove", action="store_true", help="Remove source file")
    args = parser.parse_args()

    source = Path(args.source)
    destination = Path(args.name)

    path = source.expanduser()
    relative_path = path.relative_to(Path.home())
    dest_path = Path.cwd() / destination / relative_path

    dest_path.parent.mkdir(parents=True, exist_ok=True)
    print(f" --> Copy {source} to {dest_path}")
    shutil.copy(source, dest_path)

    if args.remove:
        print(f" --> Removeing : {source}")
        source.unlink()
