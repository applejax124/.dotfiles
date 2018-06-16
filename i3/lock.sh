#!/bin/bash

# Blur Script for i3Lock
# By: Cami Carballo
# LAST EDITED: 16 June 2018


IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE" # 0.46s
BLURTYPE="5x2" # 3.80s

$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE
i3lock -i $IMAGE
rm $IMAGE
