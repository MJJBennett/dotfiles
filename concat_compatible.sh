#!/bin/bash

# Script to concatenate together a set of files for editors that can take .vimrc files
# As compatible as possible

cat vim/src.vim > .vimrc.compatible
cat vim/more.vim >> .vimrc.compatible
cat vim/python.vim >> .vimrc.compatible
