import json
import sys
import os
import subprocess

all = {}
for path in sys.argv[1:]:
    print(path, file=sys.stderr)
    meta = json.load(open(path))
    tools = meta.pop('tools')
    module = os.path.dirname(path)
    result = subprocess.run(["git", "-C", module, "rev-parse", "--short", "HEAD"], stdout=subprocess.PIPE, text=True)
    if result.returncode:
        print(result.stderr, file=sys.stderr)
    else:
        meta['revision'] = result.stdout.strip()
    for executable in tools:
        all[executable] = meta
print(json.dumps(all, indent=2))
