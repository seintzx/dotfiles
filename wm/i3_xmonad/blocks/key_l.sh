#!/bin/bash 

key=$(xset -q | grep LED | awk '{print $10}')

if [ $key = 00000000 ] || [ $key = 00000001 ] || [ $key = 00000002 ];then
    ans=$(echo "us")
elif [ $key = 00001000 ] || [ $key = 00010001 ] || [ $key = 00010002 ];then
    ans=$(echo "it")
else
    ans=$(echo "none")
fi

echo ${ans}
