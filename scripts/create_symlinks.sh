#!/bin/sh
# By: Camila Thompson
# LAST EDIT: 2 February 2022

# This script creates symlinks for all the configuration files and directories in the 
# ~/.dotfiles directory

FILES="zshrc
vimrc
xinitrc"

DIRS="i3
polybar
terminator
scripts"

for f in $FILES
do

    if [ -f ~/.$f ]; then
        rm ~/.$f
    fi
    ln -s ~/.dotfiles/$f ~/.$f

done

for d in $DIRS
do

    if [ -d ~/.config/$d ]; then
        rm ~/.config/$d
    fi
    ln -s ~/.dotfiles/$d ~/.config/$d

done
