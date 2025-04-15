import json
import sys
import subprocess

all = {}
for path in json.load(open(sys.argv[1])):
    print(path, file=sys.stderr)
    result = subprocess.run([path, '-D'], stdout=subprocess.PIPE, text=True)
    if result.returncode:
        print(result.stderr, file=sys.stderr)
        continue
    all[path] = result.stdout.strip()

print(json.dumps(all, indent=2))
