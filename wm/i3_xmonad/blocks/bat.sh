#!/bin/bash 

bat=$(acpi | cut -d " " -f4 | tr -d "%,")

if [ "$bat" -gt "70" ];then 
    echo ⚡: '<span foreground="#00ff00">'"${bat}%"'</span>'
elif [ "$bat" -gt "40" ];then 
    echo ⚡: '<span foreground="#ffff00">'"${bat}%"'</span>'
elif [ "$Bat" -lt "40" ];then
    echo ⚡: '<span foreground="#ff0000">'"${bat}%"'</span>'
fi 
