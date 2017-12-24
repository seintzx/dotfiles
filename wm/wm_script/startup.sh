#!/bin/bash

feh --bg-scale "${HOME}/Pictures/wall/wallpaper.png" --no-fehbg
xset -b
xset s off -dpms
amixer sset Master 0
amixer sset Headphone 100
amixer sset Speaker 100
numlockx on
greenclip daemon
