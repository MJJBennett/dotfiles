#!/bin/bash

function dotdif
{
    diff "$1" ~/.dotfiles/"$1";
}

dotdif git_aliases
dotdif custom_profile
dotdif more_aliases

diff vim/src.vim ~/.vim/vimrc
diff vim/more.vim ~/.vim/.more/more.vim
diff vim/python.vim ~/.vim/.more/python.vim
diff vim/extensions.vim ~/.vim/.more/extensions.vim
