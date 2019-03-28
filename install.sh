#!/bin/bash

cp .vimrc ~
mkdir -p ~/.vim/.more
cp .git_aliases ~
cp .custom_profile ~
cp .vim_more ~/.vim/.more
cp .vim_python ~/.vim/.more
cp .vim_extensions ~/.vim/.more
echo ". ~/.custom_profile" >> ~/.profile
# Don't source it - just in case :)
