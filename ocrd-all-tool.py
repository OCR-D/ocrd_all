import json
import sys
all = dict()
for path in sys.argv[1:]:
    all.update(json.load(open(path))['tools'])
print(json.dumps(all, indent=2))
