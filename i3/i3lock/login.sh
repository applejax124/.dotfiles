#!/bin/bash

# Login Script for i3Lock
# By: Cami Carballo
# LAST EDIT: 6 January 2018

IMAGE=./lock.png
ICON=./lock-icon.png
TMP=/tmp/lockscreen.png

convert $IMAGE $ICON -gravity -center -composite -matte $TMP
i3lock -u -i $TMP
rm $TMP
