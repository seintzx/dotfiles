#!/bin/bash 

Cpu=$(mpstat -u | grep "all" | awk '{print $3}')
cpu1=${Cpu:0:-3}

echo -e " $cpu1%"
