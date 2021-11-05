#!/bin/bash

# This file is meant for fresh installs.
# It is not backwards compatible.
mkdir -p "$HOME/programming/install"
mkdir -p "$HOME/programming/oss"

# Export-related things
cp exports ~/.dotfiles # Set up our exports file with custom XDG_CONFIG_HOME

# NeoVim configuration - copy to correct location
mkdir -p "$HOME/.dotfiles/nvim"
cp coc-settings.json "$HOME/.dotfiles/nvim/"
cp init.nvim "$HOME/.dotfiles/nvim/"

# REQUIRES TMUX 3.3+ - ANYTHING OLDER DOES NOT SUPPORT XDG_CONFIG_HOME
# Ahh, tmux maintainers, making things complicated even after they added support...
# Just copy things to ~/ and give up if the packaged tmux is <v3.3, I guess.
# Conveniently, tmux also doesn't support --version, so...
if [ ! -f "$HOME/.dotfiles/tmux/tmux.conf" ]; then
    cp tmux.conf "$HOME/.dotfiles/tmux/tmux.conf"
fi
mkdir -p "$HOME/.dotfiles/tmux/plugins"

# Absolute path changes

# Tmux - Set up plugins & resurrection
cd "$HOME/.dotfiles/tmux/plugins"
git clone "https://github.com/tmux-plugins/tpm"

read -r -p "Would you like to download and build clang and llvm?" response
case "$response" in
    [yY][eE][sS]|[yY]) 
        cd "$HOME/programming/oss"
        git clone https://github.com/llvm/llvm-project.git
        cd llvm-project
        mkdir build
        cd build
        cmake -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" -DCMAKE_INSTALL_PREFIX="$HOME/programming/install/clang+llvm" -DCMAKE_BUILD_TYPE=Release ../llvm
        make "-j$(nproc)"
        ;;
    *)
        echo "Not building Clang. See: https://github.com/llvm/llvm-project"
        ;;
esac

cd "$HOME/programming/install"
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls

read -r -p "Would you like to build CCLS? [REQUIRES CLANG+LLVM INSTALLED IN $HOME/programming/install/clang+llvm/] [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$HOME/programming/install/clang+llvm"
        cmake --build Release
        ;;
    *)
        echo "Not building CCLS. See: https://github.com/MaskRay/ccls/wiki/Build"
        ;;
esac

cd "$HOME/.vim/bundle/coc.nvim/"
git checkout release
