#!/bin/bash

# Script to concatenate together a set of files for editors that can take .vimrc files
# As compatible as possible

cat vim/vimrc-src > .vimrc.compatible
cat vim/vim_more >> .vimrc.compatible
cat vim/vim_python >> .vimrc.compatible
