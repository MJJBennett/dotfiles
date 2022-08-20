#!/bin/bash

# Note: Should be $XDG_CONFIG_DIR ..? not supported until 11.1?!
mkdir -p $HOME/.dotfiles/gdb
echo 'set history save on' >> $HOME/.dotfiles/gdb/gdbinit
