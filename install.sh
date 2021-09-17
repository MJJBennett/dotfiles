#!/bin/bash

# Make the folders we'll be using.
mkdir -p ~/.vim/.more
mkdir -p ~/.dotfiles/old/.dotfiles
mkdir -p ~/.dotfiles/old/.vim/.more
mkdir -p ~/.dotfiles/old/rolling

# We need to construct the vimrc first -
# In order to allow multiple build configurations,
# we need to combine the sourcing vimrc with its source
# commands. This isn't really optimal, but as they say,
# if it works, don't fix it until it causes a huge and
# damaging inconvenience.
cat vim/vimrc-sourcing-before > vimrc
cat vim/vimrc-src >> vimrc
cat vim/vimrc-sourcing-after >> vimrc

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
else # IF MARKER IS PRESENT
    cp ~/.zshrc ~/.dotfiles/rolling/zshrc
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

echo "Installing Vim configuration files."
# Install Vim configuration.
cp vimrc ~/.vim
cp vimrc output-clone/.vim
# Delete vimrc (it's generated in this script anyways)
rm vimrc
cp vim/vim_more ~/.vim/.more
cp vim/vim_python ~/.vim/.more

# Just adding this in right now because I think it might
# be useful. It doesn't seem like a big deal to have sitting
# around, and we'll source it last.
if [ ! -f ~/.vim/.more/local_vim ]; then
    touch ~/.vim/.more/local_vim
fi

# Special for YCM due to its finickiness
cp vim/vim_extensions ext.temp
if [ "$(uname)" == "Darwin" ]; then
    echo "DISABLING YouCompleteMe."
    echo "\" YCM is enabled in this Vim configuration. Disable with let g:loaded_youcompleteme = 1" >> ext.temp
else
    echo "let g:loaded_youcompleteme = 1" >> ext.temp
fi
cp ext.temp ~/.vim/.more/vim_extensions
rm ext.temp

### NON-DESTRUCTIVE
cp vim/vim_more output-clone/.vim/.more
cp vim/vim_python output-clone/.vim/.more
cp vim/vim_extensions output-clone/.vim/.more
###

echo "Installing YouCompleteMe handler."
# Install YouCompleteMe generic script.
cp vim/ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
cp vim/ycm_extra_conf.py output-clone/.vim/.ycm_extra_conf.py

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

echo "Complete install by putting `. ~/.dotfiles/custom_profile` into relevant .rc file."
