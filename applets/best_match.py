#!/usr/bin/env python3

"""
best_match.py

A python script for finding the best file to edit. Very simple at least.
"""

import sys
EXT = None
args = sys.argv[1:]

def ev(p):
    print(p)
    sys.exit(0)

if len(args) > 0 and args[0] in ['hh', 'cc', 'h', 'c']:
    EXT = args[0]
    args = args[1:]

# if the file doesn't exist we'll just let e run normally ^^
# that is, when fdfind gives us nothing
if len(args) == 0:
    ev(EXT or "")

if len(args) == 1:
    ev(args[0])

# real quick, remove folders
# we don't remove folders from the fdfind call so we can still use them above
from os.path import isdir
args = [a for a in args if not isdir(a)]

[ev(filename) for filename in args if (EXT is None or filename.endswith(EXT))]

ev(args[0])
