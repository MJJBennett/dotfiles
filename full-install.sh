#!/bin/bash

# This file is meant for configuring an entirely new system.

# TODO - Let this script run standalone, and clone the dotfiles repo and install everything through a single curl | sh.

# Prerequisites: git

## General
./install.sh

## Shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## ZSH - TODO More here
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Vim

### Vundle
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


