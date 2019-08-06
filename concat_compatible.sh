#!/bin/bash

# Script to concatenate together a set of files for editors that can take .vimrc files
# As compatible as possible

cat vimrc-src > .vimrc.compatible
cat vim_more >> .vimrc.compatible
cat vim_python >> .vimrc.compatible
