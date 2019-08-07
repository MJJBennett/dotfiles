function dotdif
{
    diff "$1" ~/.dotfiles/"$1";
}

dotdif git_aliases
dotdif custom_profile
dotdif more_aliases

diff vim/vimrc-src ~/.vim/vimrc
diff vim/vim_more ~/.vim/.more/vim_more
diff vim/vim_python ~/.vim/.more/vim_python
diff vim/vim_extensions ~/.vim/.more/vim_extensions

diff vim/ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
