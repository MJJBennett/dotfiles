#!/usr/bin/env python3

"""
last_edited.py

A python script for caching & reading from that cache the most recently edited file.
"""

# Quickly port some parsing methods
def consume(a):
    if len(a) == 0:
        a = [None]
    return (a[0], a[1:])

def parsed(args):
    params = list()
    norm = list()
    skip = False
    while len(args) > 0:
        arg, args = consume(args)
        if skip or not arg.startswith('--'):
            norm.append(arg)
            continue
        if arg == '--':
            skip = True
            continue
        params.append(arg.strip('-'))
    return (params, norm)

def get_paths_path():
    from pathlib import Path
    from os.path import join
    # This should use XDG_CACHE_HOME
    return join(Path.home(), '.cache/.last-edited')

def get_paths():
    return [line.strip() for line in open(get_paths_path(), 'r')]

def update_paths(paths):
    with open(get_paths_path(), 'w') as file:
        [file.write(line + '\n') for line in paths]

def get_matches(paths, exprs):
    return [p for p in paths if all([e in p for e in exprs])]

def get_edit_path(args, paths):
    from os.path import isfile, abspath
    if len(args) > 0 and isfile(args[0]):
        # We are editing this file directly.
        # Update the cache.
        return abspath(args[0])
    if len(args) > 0:
        # We want to edit some file.
        # Try to find it.
        return (get_matches(paths, args) or [args[0]])[0]
    return (paths or [''])[0]

def main(args):
    params, args = parsed(args) 
    paths = get_paths()

    # Parameters:
    # list-matches - List all files that match the criterion.
    # Exits early.
    if 'list-matches' in params:
        print('\n'.join(get_matches(paths, args)))
        import sys
        sys.exit(0)

    # This is the file we want to edit.
    # If the file already exists
    edit_path = get_edit_path(args, paths)
    from os.path import isfile
    if isfile(edit_path):
        if edit_path in paths:
            paths.remove(edit_path)
        paths.insert(0, edit_path)
        update_paths(paths)
    print(edit_path)

if __name__ == '__main__':
    import sys
    main(sys.argv[1:])
