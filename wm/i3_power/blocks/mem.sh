#!/bin/bash 

ram=$(free | grep "^Mem:" | awk '{print $3/$2 * 100}')
mem=${ram:0:2}

echo '<span background="#000000">'" $mem%"'</span>'
