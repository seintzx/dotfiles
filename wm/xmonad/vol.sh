#!/bin/bash
str=`amixer -D pulse sget Master`
str1=${str#Simple*\[}
v1=${str1%%]*]}

echo ♪: 
echo $v1
