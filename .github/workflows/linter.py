#!/usr/bin/env python

import os
import re
import sys


class Annotation:
    def __init__(self, path, line, message, severity):
        self.path = path
        self.line = line
        self.message = message
        self.severity = severity

    def __str__(self):
        return self.path + ":" + str(self.line) + " " + self.severity + " " + self.message


def findfiles(path, regex):
    reg_obj = re.compile(regex)
    res = []
    for root, _dirs, fnames in os.walk(path):
        for fname in fnames:
            if reg_obj.match(fname):
                res.append(os.path.join(root, fname))
    return res


def grep(filepath, regex):
    reg_obj = re.compile(regex)
    res = []
    with open(filepath) as f:
        for index, line in enumerate(f):
            if reg_obj.match(line):
                res.append(Annotation(filepath, index, "IO.inspect", "error"))
    return res


def main():
    files = findfiles('lib', r'.*\.ex$')
    annotations = []

    for file in files:
        matches = grep(file, r'.*IO\.inspect.*')
        annotations += matches

    for annotation in annotations:
        print(annotation)

    if annotations != []:
        sys.exit(1)


if __name__ == "__main__":
    main()
