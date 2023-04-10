import json
import os
DIR = os.getcwd()
JSON_PATH = os.path.join(DIR, "stories.json")
print(JSON_PATH)
f = open(JSON_PATH, encoding="UTF-8")
stories = json.loads(f.read())

for info in stories:
    print(info['name']+'::'+info['story'])
