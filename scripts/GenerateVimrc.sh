#!/bin/bash

echo "\" THIS FILE HAS BEEN AUTOMATICALLY GENERATED." >> vimrc
echo "\" PLEASE MODIFY ITS SOURCE FILES INSTEAD." >> vimrc
echo "\" SOURCE FILES:" >> vimrc
echo "\"   vim/before.vim" >> vimrc
echo "\"   vim/src.vim" >> vimrc
echo "\"   vim/after.vim" >> vimrc
cat vim/before.vim >> vimrc
cat vim/src.vim >> vimrc
cat vim/after.vim >> vimrc
