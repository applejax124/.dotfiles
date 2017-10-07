#!/bin/bash

# Blur Script for i3Lock
# By: Cami Carballo
# LAST EDITED: 4 October 2017


IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE" # 0.46s

#BLURTYPE="0x5" # 7.52s
#BLURTYPE="0x2" # 4.39s
BLURTYPE="5x2" # 3.80s
#BLURTYPE="2x8" # 2.90s
#BLURTYPE="2x3" # 2.92s

$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE
i3lock -i $IMAGE
rm $IMAGE
