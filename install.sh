#!/bin/bash

# Make the folders we'll be using.
mkdir -p ~/.vim/.more
mkdir -p ~/.dotfiles
mkdir -p ~/.dotfiles/old
mkdir -p ~/.dotfiles/old/.dotfiles
mkdir -p ~/.dotfiles/old/.vim
mkdir -p ~/.dotfiles/old/.vim/.more

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

# More backups, this time for Vim configuration
if [ -e ~/.vim/vimrc ]
    then cp ~/.vim/vimrc ~/.dotfiles/old/.vim/
fi
if [ -e ~/.vim/.more/vim_more ]
    then cp ~/.vim/.more/vim_more ~/.dotfiles/old/.vim/.more/
fi
if [ -e ~/.vim/.more/vim_python ]
    then cp ~/.vim/.more/vim_python ~/.dotfiles/old/.vim/.more/
fi
if [ -e ~/.vim/.more/vim_extensions ]
    then cp ~/.vim/.more/vim_extensions ~/.dotfiles/old/.vim/.more/
fi
if [ -e ~/.vim/.ycm_extra_conf.py ]
    then cp ~/.vim/.ycm_extra_conf.py ~/.dotfiles/old/.vim/
fi
if [ -e ~/.zshrc ]
    then cp ~/.zshrc ~/.dotfiles/old/.zshrc
fi
fi

echo "Installing generic configuration files."
# Install generic configuration. (Aliases mostly)
cp git_aliases ~/.dotfiles
cp custom_profile ~/.dotfiles
cp more_aliases ~/.dotfiles

echo "Installing Vim configuration files."
# Install Vim configuration.
cp vimrc ~/.vim
cp vim_more ~/.vim/.more
cp vim_python ~/.vim/.more
cp vim_extensions ~/.vim/.more

echo "Installing YouCompleteMe handler."
# Install YouCompleteMe generic script.
cp ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py

# Make a marker that this script has been run, so backups aren't made again.
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

echo "Installing zshrc."
cp .zshrc ~/

echo "Complete install by putting `. ~/.dotfiles/custom_profile` into relevant .rc file."
