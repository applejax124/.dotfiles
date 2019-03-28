#!/usr/bin/bash
# By: Cami Carballo
# LAST EDIT: 22 March 2019

# This script creates symlinks for all the configuration files and directories in the 
# ~/.dotfiles directory

FILES="bash_profile
bashrc
vimrc
xinitrc"

DIRS="dunst
i3
polybar
terminator
scripts"

SYSD="/etc/systemd"

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

if [ -f $SYSD/wakelock.service ]; then
    sudo rm -rf $SYSD/wakelock.service
fi
if [ -f $SYSD/wakelock.service ]; then
    sudo rm -rf $SYSD/wakelock.service 
fi

sudo ln -s ~/.dotfiles/systemd/wakelock.service $SYSD/sleep.target.wants/wakelock.service
sudo chown root $SYSD/sleep.target.wants/wakelock.service
sudo ln -s ~/.dotfiles/systemd/wakelock.service $SYSD/suspend.target.wants/wakelock.service
sudo chown root $SYSD/suspend.target.wants/wakelock.service
