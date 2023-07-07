#!/usr/bin/env python
import sys
from pathlib import Path
import subprocess

# Later the address (or rather the port) should be dynamic
processing_server_address = "http://localhost:8000"
processor_name = "{{ processor_name }}"

args = list(sys.argv)
if "-m" in args:
    idx = args.index("-m")
    metspath = args[idx + 1]
    if Path(metspath).is_absolute():
        print("absolute path is not supported")
        exit(1)
    args[idx + 1] = f"/data/{metspath}"


cmd = [
    "ocrd", "network", "client", "processing", "processor",
    processor_name, "--address", processing_server_address
]
subprocess.run(cmd + args[1:])
