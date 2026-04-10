#!/usr/bin/env python3
from subprocess import Popen
from pathlib import Path
from argparse import ArgumentParser

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("source", help="Source file")
    args = parser.parse_args()

    source = Path(args.source)
    if source.is_file():
        # Remove top directory from path
        org_file = Path.home() / Path(*source.parts[1:])
        cmdline = ["diff", str(source), str(org_file)]
        print(f"Running: {' '.join(cmdline)}")
        Popen(cmdline)

    else:
        print(f"Source {source} is not a file")
