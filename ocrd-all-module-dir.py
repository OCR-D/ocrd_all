import json
import sys
import subprocess

all = { key: subprocess.run([key, '-D'], stdout=subprocess.PIPE, text=True).stdout.strip()
        for key in json.load(open(sys.argv[1])) }
print(json.dumps(all, indent=2))
