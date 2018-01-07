#!/bin/bash

# Blur Script for i3Lock
# By: Cami Carballo
# LAST EDITED: 4 October 2017


IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE" # 0.46s
ICON=./lock-icon.png
BLURTYPE="5x2" # 3.80s

$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE
convert $IMAGE $ICON -gravity center -composite -matte $IMAGE
i3lock -u -i $IMAGE
rm $IMAGE
