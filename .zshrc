# This is a customized version of the autogenerated .zshrc file
# created by ZSH upon request when first going through installation.

# Path to the oh-my-zsh installation.
# Note - this was absolute before (/Users/user/...) but I've modified
# it to use $HOME instead, revert if this causes errors.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# Can set to "random" for ...fun
ZSH_THEME="agnoster"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git 
    vi-mode
    bundler
    dotenv
    osx
    rake
    zsh-autosuggestions
    last-working-dir
    web-search
    extract
    history
    sudo
    yarn
)

# Note - Might be worth investigating where exactly this source should go
# Feels like it should probably go before or after everything else, not
# here in the middle as it is currently.
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# this is awesome by the way
. ~/.oh-my-zsh/plugins/z/z.sh

# This is for the vi mode plugin - jj is remapped to esc 
bindkey -M viins 'jj' vi-cmd-mode

# Finally source everything else
source ~/.dotfiles/custom_profile
