#!/bin/bash 

key=$(xset -q | grep LED | awk '{print $10}')

if [ $key = 00000002 ];then
    ans=$(echo " gb")
elif [ $key = 00001002 ];then
    ans=$(echo " it")
else
    ans=$(echo " none")
fi

echo '<span background="#444444">'${ans}'</span>'
