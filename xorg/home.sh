#!/bin/sh

INTERNAL="eDP1"
EXERNAL="DP3"

if xrandr | grep "${EXTERNAL} connected"; then
    xrandr \
        --output ${INTERNAL} --primary --mode 3840x2160 \
        --output ${EXTERNAL} --scale 2x2 --pos 3840x0 \
        --panning 3840x2160+3840+0
fi
