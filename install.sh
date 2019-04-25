#!/bin/bash

# Make the folders we'll be using.
mkdir -p ~/.vim/.more
mkdir -p ~/.dotfiles

# Install generic configuration. (Aliases mostly)
cp git_aliases ~/.dotfiles
cp custom_profile ~/.dotfiles
cp more_aliases ~/.dotfiles

# Install Vim configuration.
cp vimrc ~/.vim
cp vim_more ~/.vim/.more
cp vim_python ~/.vim/.more
cp vim_extensions ~/.vim/.more

# Install YouCompleteMe generic script.
cp ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py

if [ -f ~/.profile ]; then
    echo ". ~/.dotfiles/custom_profile" >> ~/.profile
elif [ -f ~/.bash_profile ]; then
    echo ". ~/.dotfiles/custom_profile" >> ~/.bashrc
elif [ -f ~/.bashrc ]; then
    echo ". ~/.dotfiles/custom_profile" >> ~/.bash_profile
else
    echo "Could not find a place to stick the sourcing of ~/.dotfiles/.custom_profile !"
fi

