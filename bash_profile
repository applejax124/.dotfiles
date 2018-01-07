#!/usr/bin/sh

# ~/.bash_profile
# by: Cami Carballo
# LAST EDIT: 6 January 2018

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
