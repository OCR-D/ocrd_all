import json
import sys

all = {}
for path in sys.argv[1:]:
    print(path, file=sys.stderr)
    all.update(json.load(open(path))['tools'])
print(json.dumps(all, indent=2))
