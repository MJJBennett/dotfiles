function pre_setup {
    # Make the folders we'll be using.
    mkdir -p ~/.vim/.more
    mkdir -p ~/.dotfiles/old/.dotfiles
    mkdir -p ~/.dotfiles/old/.vim/.more

    # We need to construct the vimrc first -
    # In order to allow multiple build configurations,
    # we need to combine the sourcing vimrc with its source
    # commands. This isn't really optimal, but as they say,
    # if it works, don't fix it until it causes a huge and
    # damaging inconvenience.
    cat vim/vimrc-sourcing-before > vimrc
    cat vim/vimrc-src >> vimrc
    cat vim/vimrc-sourcing-after >> vimrc
}
function backup {
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
    fi # WIP THIS IS THE MARKER STUFF
}

if [[ "$#" -eq 0 ]]; then
    pre_setup
    backup

fi

while [[ "$#" -ne 0 ]]
do
    if [[ "$1" == "-pre" ]]

done
