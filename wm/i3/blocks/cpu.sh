#!/bin/bash 

Cpu=$(mpstat -u | grep "all" | awk '{print $3}')
cpu1=${Cpu:0:-3}

echo '<span background="#444444">'" $cpu1%"'</span>'
