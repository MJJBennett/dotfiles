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
rm vimrc # Delete vimrc (it's generated in this script anyways)

cd vim

mkdir -p ~/.vim/.more

cp more.vim ~/.vim/.more
cp python.vim ~/.vim/.more

# Just adding this in right now because I think it might
# be useful. It doesn't seem like a big deal to have sitting
# around, and we'll source it last.
if [ ! -f ~/.vim/.more/local.vim ]; then
    touch ~/.vim/.more/local.vim
fi

scripts/install.sh

cp extensions.vim ~/.vim/.more/extensions.vim
