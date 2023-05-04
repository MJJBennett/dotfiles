#!/bin/bash

function safe_overwrite() {
    SRC="$1"
    DST="$2"

    if [ -f "$DST" ] && [ ! -f "temp/$(basename $DST)" ]; then
        echo "Making a backup of $DST to temp/$(basename $DST) "
        mkdir -p temp
        cp "$DST" "temp/$(basename $DST)"
    fi
    cp "$SRC" "$DST"
}

echo "Installing Vim configuration files."
vim/install.sh

# Make z happy (happier...)
mkdir -p ~/.config/z

echo "Installing zshrc."
safe_overwrite ".zshrc" "$HOME/.zshrc"

git config --global init.defaultBranch main
