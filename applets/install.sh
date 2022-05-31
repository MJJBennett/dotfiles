#!/bin/bash

SCRIPT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
mkdir -p $HOME/programming/install

cp $SCRIPT_DIR/*.py $HOME/programming/install
cp $SCRIPT_DIR/editor_config $HOME/.dotfiles/
