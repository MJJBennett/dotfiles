#!/bin/bash

cp .git_aliases ~
cp .custom_profile ~
cp .vimrc ~
echo ". ~/.custom_profile" >> ~/.profile
# Don't source it - just in case :)
