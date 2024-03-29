# Things we inject into the environment.
# alias debug_print="echo"
function debug_print() { :; }

. ~/.config/dotfiles/git_aliases.sh
. ~/.config/dotfiles/more_aliases.sh
. ~/.config/dotfiles/exports.sh
. ~/.config/dotfiles/profile.sh

# Functions!
. ~/.config/dotfiles/functions/e_related.sh
. ~/.config/dotfiles/functions/crypt.sh

# Let's start putting anything shell-agnostic in here, instead of in *rc

# Sounds
set bell-style none


# This must be the last thing in this file.
# Otherwise, it cannot overwrite things (e.g. exports from ~/.config/dotfiles/exports)
if [ -f ~/.config/local_exports ]; then 
    . ~/.config/local_exports
fi
if [ -f ~/.config/local_profile ]; then 
    . ~/.config/local_profile
fi
### LAST LINE OF FILE ###
