#!/bin/bash 

key=$(xset -q | grep LED | awk '{print $10}')

if [ $key = 00000002 ];then
    echo " gb"
elif [ $key = 00001002 ];then
        echo " it"
else
        echo " none"
fi
