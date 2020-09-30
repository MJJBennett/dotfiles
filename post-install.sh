#!/bin/bash

# Make the folders we'll be using.
mkdir -p ~/.vim/plugin

# Setup: vim-autopep8
cp ~/.vim/bundle/vim-autopep8/ftplugin/python_autopep8.vim ~/.vim/plugin/

# Setup: YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe/ && ./install.py --clang-completer
echo "Make sure to set g:loaded_youcompleteme = 0 in vimrc."
