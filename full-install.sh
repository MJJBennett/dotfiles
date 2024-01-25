#!/bin/bash

# This file is meant for configuring an entirely new system.

# TODO - Let this script run standalone, and clone the dotfiles repo and install everything through a single curl | sh.

# Prerequisites: git, zsh
PM="${PM:-apt}"
if ! type "${PM}" > /dev/null; then
    echo "${PM} not installed, try with PM=yum or etc"
    exit 1
fi

sudo ${PM} install -y curl neovim git fzf zsh

if ! type zsh > /dev/null; then
    echo "zsh is not installed. Install using your current package manager."
    exit 1
fi

## General
echo "Running main installation script."
./install.sh

## Shell
echo "Installing oh-my-zsh."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wait

## ZSH - TODO More here
scripts/CloneZshPlugins.sh

## Vim

### Vundle
#echo "Installing Vundle."
#mkdir -p ~/.vim/bundle/
#wait
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#wait
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

### Plugin Installation
echo "Installing all Vim plugins."
nvim -c 'PlugInstall' -c 'qa'

echo "Full-install seems to have completed."
