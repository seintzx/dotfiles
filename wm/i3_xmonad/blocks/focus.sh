#!/bin/bash

focus=$(xdotool getactivewindow getwindowname)
focus_Number=$(xdotoolgetactivewindow getwindowname | wc -c)
Focus_N=$(xdotool getactivewindowgetwindowname | head -c 40 )

if [ "$focus" = "" ];then 
    echo -e " : Gatter Linux "    
else 
    if [ "$focus_Number" -gt "40" ];then 
        echo -e " : $Focus_N ..." 
    else 
        echo -e " : $focus"
    fi
fi
