#!/bin/bash

cp vimrc ~/.vim
mkdir -p ~/.vim/.more
mkdir -p ~/.dotfiles
cp .git_aliases ~/.dotfiles
cp .custom_profile ~/.dotfiles
cp .more_aliases ~/.dotfiles
cp .vim_more ~/.vim/.more
cp .vim_python ~/.vim/.more
cp .vim_extensions ~/.vim/.more
if [ -f ~/.profile ]; then
    echo ". ~/.dotfiles/.custom_profile" >> ~/.profile
elif [ -f ~/.bash_profile ]; then
    echo ". ~/.dotfiles/.custom_profile" >> ~/.bash_profile
else
    echo "Could not find a place to stick the sourcing of ~/.dotfiles/.custom_profile !"
fi
# Don't source it - just in case :) 
