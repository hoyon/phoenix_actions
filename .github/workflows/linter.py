#!/usr/bin/env python

import json
import os
import re


class Annotation:
    def __init__(self, path, title, message, line, level):
        self.path = path
        self.title = title
        self.message = message
        self.start_line = line
        self.end_line = line
        self.annotation_level = level

    def __str__(self):
        return str(self.__class__) + ": " + str(self.__dict__)

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)

class MyEncoder(json.JSONEncoder):
    def default(self, o):
        return o.__dict__


def make_json(conclusion, annotations):
    output = {
        "name": "my linter",
        "head_sha": os.environ.get('COMMIT_SHA', 'your git sha'),
        "status": "completed",
        "conclusion": conclusion,
        "output": {
            "title": "my test",
            "summary": "something went wrong",
            "text": "you suck",
            "annotations": annotations
        }
    }

    return json.dumps(output, cls=MyEncoder)




def findfiles(path, regex):
    regObj = re.compile(regex)
    res = []
    for root, dirs, fnames in os.walk(path):
        for fname in fnames:
            if regObj.match(fname):
                res.append(os.path.join(root, fname))
    return res


def grep(filepath, regex):
    regObj = re.compile(regex)
    res = []
    with open(filepath) as f:
        for index, line in enumerate(f):
            if regObj.match(line):
                res.append(Annotation(filepath, "IO.inspect", "no debugging allowed", index, "error"))
    return res

files = findfiles('./lib', r'.*\.ex$')

annotations = []

for f in files:
    matches = grep(f, r'.*IO\.inspect.*')
    annotations += matches


print(make_json("failure", annotations))
