import json
import sys
all = dict()
for path in sys.argv[1:]:
    tool = json.load(open(path))
    dockerhub = tool.get('dockerhub', '')
    for executable in tool['tools']:
        all[executable] = dockerhub
print(json.dumps(all, indent=2))
