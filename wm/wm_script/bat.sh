#!/bin/bash 

bat=$(acpi | cut -d " " -f4 | tr -d "%,")

# xmonad
# if [ "$bat" -gt "70" ];then 
#     echo -e "\uf240 <fc=#00ff00>${bat}</fc>"
# elif [ "$bat" -gt "40" ];then 
#     echo -e "\uf240 <fc=#ffff00>${bat}</fc>"
# elif [ "$bat" -le "40" ];then
#     echo -e "\uf240 <fc=#ff0000>${bat}</fc>"
# fi 

# i3
if [ "$bat" -gt "70" ];then 
    echo -e "\uf240 <span foreground=\"#00ff00\">${bat}</span>"
elif [ "$bat" -gt "40" ];then 
    echo -e "\uf240 <span foreground=\"#ffff00\">${bat}</span>"
elif [ "$bat" -le "40" ];then
    echo -e "\uf240 <span foreground=\"#ff0000\">${bat}</span>"
fi 
