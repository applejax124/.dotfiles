#!/bin/bash

# Blur Script for i3Lock
# By: Cami Carballo
# LAST EDITED: 22 March 2019


IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE" # 0.46s
BLURTYPE="20x10" # 3.80s

$SCREENSHOT

#BLUR
#convert $IMAGE -blur $BLURTYPE $IMAGE

#PIXELATE
convert -scale 10% -scale 1000% $IMAGE $IMAGE

i3lock -i $IMAGE
rm $IMAGE
