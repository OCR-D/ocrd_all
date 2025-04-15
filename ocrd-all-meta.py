import json
import sys
all = dict()
for path in sys.argv[1:]:
    print(path, file=sys.stderr)
    meta = json.load(open(path))
    tools = meta.pop('tools')
    for executable in tools:
        all[executable] = meta
print(json.dumps(all, indent=2))
