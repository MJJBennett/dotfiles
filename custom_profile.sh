# Things we inject into the environment.
# alias debug_print="echo"
function debug_print() { :; }

. ~/.config/dotfiles/git_aliases.sh
. ~/.config/dotfiles/more_aliases.sh
. ~/.config/dotfiles/exports.sh

. ~/.config/dotfiles/fzf_based.sh

# Functions!
. ~/.config/dotfiles/functions/e_related.sh
. ~/.config/dotfiles/functions/crypt.sh

# Let's start putting anything shell-agnostic in here, instead of in *rc

# Sounds
set bell-style none


# This must be the last thing in this file.
# Otherwise, it cannot overwrite things (e.g. exports from ~/.config/dotfiles/exports)
if [ -f ~/.config/local_exports ]; then 
    echo "~/.config/local_exports is deprecated, please add the .sh file extension."
    . ~/.config/local_exports
fi
if [ -f ~/.config/local_profile ]; then 
    echo "~/.config/local_profile is deprecated, please add the .sh file extension."
    . ~/.config/local_profile
fi

if [ -f ~/.config/local_exports.sh ]; then 
    . ~/.config/local_exports.sh
fi
if [ -f ~/.config/local_profile.sh ]; then 
    . ~/.config/local_profile.sh
fi
### LAST LINE OF FILE ###
