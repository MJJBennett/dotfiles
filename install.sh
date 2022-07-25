#!/bin/bash

# Make the folders we'll be using.
mkdir -p ~/.dotfiles/old/.dotfiles
mkdir -p ~/.dotfiles/old/.vim/.more
mkdir -p ~/.dotfiles/old/rolling

#### BEGIN
# Non-destructive commands; ignore for paranoia
if [ ! -f ~/.dotfiles/old/.marker ]; then
echo "Backing up current configuration files."
# Back up current configuration before potential overwrites
# A future uninstall script could copy these back before removing directories and/or files.
if [ -e ~/.dotfiles/git_aliases ]
    then cp ~/.dotfiles/git_aliases ~/.dotfiles/old/.dotfiles/
fi
if [ -e ~/.dotfiles/custom_profile ]
    then cp ~/.dotfiles/custom_profile ~/.dotfiles/old/.dotfiles/
fi
if [ -e ~/.dotfiles/more_aliases ]
    then cp ~/.dotfiles/more_aliases ~/.dotfiles/old/.dotfiles/
fi

if [ -e ~/.zshrc ]
    then cp ~/.zshrc ~/.dotfiles/old/.zshrc
fi
else # IF MARKER IS PRESENT
    cp ~/.zshrc ~/.dotfiles/old/rolling/zshrc
fi
#### END

####################################
##### BEGIN DESTRUCTIVE COPIES #####
####################################

echo "Installing generic configuration files."
# Install generic configuration. (Aliases mostly)
cp git_aliases ~/.dotfiles
cp git_aliases output-clone/.dotfiles
cp custom_profile ~/.dotfiles
cp custom_profile output-clone/.dotfiles
cp more_aliases ~/.dotfiles
cp more_aliases output-clone/.dotfiles
cp -r functions ~/.dotfiles

echo "Installing Vim configuration files."
vim/install.sh

# Make a marker that this script has been run, so backups aren't made again.
# Actually, it's so that we don't overwrite the user backups.
touch ~/.dotfiles/old/.marker

# if [ -f ~/.profile ]; then
#     echo ". ~/.dotfiles/custom_profile" >> ~/.profile
# elif [ -f ~/.bash_profile ]; then
#     echo ". ~/.dotfiles/custom_profile" >> ~/.bash_profile
# elif [ -f ~/.bashrc ]; then
#     echo ". ~/.dotfiles/custom_profile" >> ~/.bashrc
# else
#     echo "Could not find a place to stick the sourcing of ~/.dotfiles/.custom_profile !"
# fi

mkdir -p ~/.dotfiles/z

echo "Installing zshrc."
cp .zshrc ~/

echo "Complete install by putting '. ~/.dotfiles/custom_profile' into relevant .rc file."
