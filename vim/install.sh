#!/bin/bash

if [ ! -d $HOME/.vim ]; then
    echo "~/.vim does not exist. Exiting Vim install." 1>&2;
    exit 1
fi

# Location of our base dotfiles directory.
BASE_DIR="$(dirname $0)/.."

# We need to construct the vimrc first -
# In order to allow multiple build configurations,
# we need to combine the sourcing vimrc with its source
# commands. This isn't really optimal, but as they say,
# if it works, don't fix it until it causes a huge and
# damaging inconvenience.
# Note: It is now causing more of an inconvenience, but
# that's all fine. We insert this section first because
# the paths are kinda absolute in the helper script and
# it makes for some unhappiness.
cd "${BASE_DIR}"
scripts/GenerateVimrc.sh
cp vimrc ~/.vim # Install Vim configuration.
cp vimrc "output-clone/.vim"
rm vimrc # Delete vimrc (it's generated in this script anyways)

cd vim

mkdir -p ~/.vim/.more

cp vim_more ~/.vim/.more
cp vim_python ~/.vim/.more

# Just adding this in right now because I think it might
# be useful. It doesn't seem like a big deal to have sitting
# around, and we'll source it last.
if [ ! -f ~/.vim/.more/local_vim ]; then
    touch ~/.vim/.more/local_vim
fi

scripts/install.sh

# Special for YCM due to its finickiness
cp vim_extensions ext.temp
#if [ "$(uname)" == "Darwin" ]; then
#    echo "ENABLING YouCompleteMe."
#    echo "\" YCM is enabled in this Vim configuration. Disable with let g:loaded_youcompleteme = 1" >> ext.temp
#else
    echo "DISABLING YouCompleteMe."
    echo "let g:loaded_youcompleteme = 1" >> ext.temp
#fi
cp ext.temp ~/.vim/.more/vim_extensions
rm ext.temp

### NON-DESTRUCTIVE
# we're done with this for now I think. kinda weird
# we'd have to do this in an expandable way for it to be worthwhile
#cp vim_more "${BASED}/../output-clone/.vim/.more"
#cp vim_python "${BASED}/../output-clone/.vim/.more"
#cp vim_extensions "${BASED}/../output-clone/.vim/.more"
#cp ycm_extra_conf.py "${BASED}/../output-clone/.vim/.ycm_extra_conf.py"
###

echo "Installing YouCompleteMe handler."
# Install YouCompleteMe generic script.
cp ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
