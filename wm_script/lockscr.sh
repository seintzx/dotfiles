#!/bin/bash
# NOTE: The resize is done to speed up the process

# IMAGE=${HOME}/Pictures/wall/lockscreen.png
IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE"
BLURTYPE="2x8"
$SCREENSHOT
convert $IMAGE -resize 50%
convert $IMAGE -blur $BLURTYPE $IMAGE
convert $IMAGE -resize 200%
i3lock -n -i $IMAGE -e
rm $IMAGE
