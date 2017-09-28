#!/bin/bash 
#     echo -e " Mute"

str=`amixer get Master`
str1=${str#Simple*\[}
v1=${str1%%]*]}
v2=${v1:0:-1}

if [ "$v2" -gt "80" ];then
    ans=$(echo -e " $v1")
elif [ "$v2" -gt "60" ];then
    ans=$(echo -e " $v1")
elif [ "$v2" -gt "40" ];then
    ans=$(echo -e " $v1")
elif [ "$v2" -gt "20" ];then
    ans=$(echo -e " $v1")
elif [ "$v2" -eq "0" ];then 
    ans=$(echo -e " $v1")
fi 

echo ${v1}
