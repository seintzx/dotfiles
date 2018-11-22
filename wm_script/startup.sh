#!/bin/bash

feh --bg-scale "${HOME}/Pictures/wall/wallpaper.png" --no-fehbg
xset -b
xset s off -dpms
numlockx on
dunst &
greenclip daemon &
