#!/bin/bash 

bat=$(acpi | cut -d " " -f4 | tr -d "%,")

echo ⚡: ${bat}%
