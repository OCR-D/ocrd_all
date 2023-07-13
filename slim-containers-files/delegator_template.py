#!/usr/bin/env python
import sys
import subprocess

# Later the address (or rather the port) should be dynamic
processing_server_address = "http://localhost:{{ OCRD_PS_PORT }}"
processor_name = "{{ processor_name }}"

args = list(sys.argv)


cmd = [
    "ocrd", "network", "client", "processing", "processor",
    processor_name, "--address", processing_server_address
]
subprocess.run(cmd + args[1:])
