if [ -d /usr/lib/wsl/ ]; then
    # IMPORTANT: PATH CONFIGURATION
    # Because we want to overwrite the user's path whenever we load in. Otherwise we have issues.
    # Don't do this outside of WSL (or tmux?)
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/wsl/lib:/snap/bin"
fi

# PRE-SETUP SOURCING.
# These are done as soon as possible so that utilities, etc. are available in later setup steps
# if necessary. Mostly just fixing path, etc.
if [ -f "$HOME/.local/presource.sh" ]; then
    . "$HOME/.local/presource.sh" 
fi

##########################################################################################
########################### THEMES CONFIGURATION #########################################
##########################################################################################
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# Can set to "random" for ...fun
ZSH_THEME="robbyrussell"
if [ -f ~/.config/local_theme ]; then 
    echo "local_theme is deprecated. Please rename to ~/.local/theme.sh"
    . ~/.config/local_theme
fi
if [ -f "$HOME/.local/theme.sh" ]; then
    .  "$HOME/.local/theme.sh"
fi

export COLORTERM=truecolor

if [ "$ZSH_THEME" = "powerlevel10k/powerlevel10k" ]; then
    # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
    # Initialization code that may require console input (password prompts, [y/n]
    # confirmations, etc.) must go above this block; everything else may go below.
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
fi
##########################################################################################

# This is a customized version of the autogenerated .zshrc file
# created by ZSH upon request when first going through installation.

# Path to the oh-my-zsh installation.
# Note - this was absolute before (/Users/user/...) but I've modified
# it to use $HOME instead, revert if this causes errors.
export ZSH="$HOME/.oh-my-zsh"

# Just gonna throw this in reaaaal quick
export _Z_DATA="$HOME/.config/z/zstore"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# Ahhhh, zsh. Ever useful.
HIST_STAMPS="%d/%m/%y (%T) => "

# Some plugins require preconfiguration.
# In the future, this should be moved to a ~/.config file.

# Zsh-Vi-Mode (JeffreyTse) configuration
function zvm_config() {
    # ZVM_CURSOR_BLINKING_BLOCK could be used instead
    # https://github.com/jeffreytse/zsh-vi-mode
    # ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
    ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
}

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git 
    zsh-vi-mode
    bundler
    dotenv
    macos
    rake
    zsh-autosuggestions
    last-working-dir
    web-search
    extract
    history
    sudo
    yarn
    zsh-syntax-highlighting
    z
)

unsetopt BEEP

# Note - Might be worth investigating where exactly this source should go
# Feels like it should probably go before or after everything else, not
# here in the middle as it is currently.
source $ZSH/oh-my-zsh.sh

# This is for the vi mode plugin - jj is remapped to esc 
# Deprecated / commented out for now; remove after it works.
# bindkey -M viins 'jj' vi-cmd-mode

# Finally source everything else
source ~/.config/dotfiles/custom_profile.sh

if [ "$ZSH_THEME" = "powerlevel10k/powerlevel10k" ]; then
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi
