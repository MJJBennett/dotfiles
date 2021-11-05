#!/bin/bash

### Installs (via git clone) several Zsh plugins, to ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}. As of writing, this is the default.
echo "Installing zsh autosuggestions."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wait
echo "Installing zsh syntax highlighting."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
wait
echo "Installing zsh vi mode."
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
wait
