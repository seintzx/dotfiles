#!/bin/bash

str=`amixer sget Master`
str1=${str#Simple*\[}
v1=${str1%%]*]}

echo -e "\uf3b5${v1}"
# bash -c 'echo -e "\uf3b5 $(amixer sget Master | grep "Front Right:" | sed "s/[a-zA-Z: ]//g" | sed "s/0//" | sed "s/\[//g" | sed "s/\]//g")"'
