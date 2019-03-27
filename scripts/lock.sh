#!/bin/bash
# By: Cami Carballo
# LAST EDITED: 22 March 2019

# Lock script for i3lock -- blurs or pixelates and sets up colors for lock indicator

#COLORS
DBLUE='4e657cff'
BLUE='9fb6cdff'
GRAY='444444dd'
RED='ff9e9eff'

#STRINGS
TIME="%I:%M %p"
DATE="%A, %B %-d"
WRONG="Nope!"
VERIF="Verifying..."

IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE" # 0.46s
BLURTYPE="20x10" # 3.80s


$SCREENSHOT

#BLUR
#convert $IMAGE -blur $BLURTYPE $IMAGE

#PIXELATE
convert -scale 10% -scale 1000% $IMAGE $IMAGE

i3lock -i $IMAGE --clock --indicator --timestr="$TIME" --datestr="$DATE" \
--timecolor=$BLUE --datecolor=$BLUE --insidecolor=$GRAY --ringcolor=$BLUE \
--timesize=40 --datesize=20 --verifsize=40 --wrongsize=40 --radius 150 \
--wrongtext="$WRONG" --veriftext="$VERIF" --verifcolor=$BLUE --wrongcolor=$BLUE \
--keyhlcolor=$DBLUE --bshlcolor=$RED \
--insidevercolor=$GRAY --ringvercolor=$BLUE --insidewrongcolor=$GRAY --ringwrongcolor=$BLUE 

rm $IMAGE
