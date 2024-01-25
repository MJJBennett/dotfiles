#!/bin/bash

function dotdif
{
    diff "$1" ~/.dotfiles/"$1";
}

dotdif git_aliases
dotdif custom_profile.sh
dotdif more_aliases.sh

diff vim/src.vim ~/.vim/vimrc
diff vim/more.vim ~/.vim/.more/more.vim
diff vim/python.vim ~/.vim/.more/python.vim
diff vim/extensions.vim ~/.vim/.more/extensions.vim
