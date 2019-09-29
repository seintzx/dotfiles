#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)

NOINSTALL=`find . -mindepth 1 -maxdepth 1 -type d '!' -exec test -e "{}/install.sh" ';' \
            -print | awk -F '/' '{print $2}' | uniq | sort | grep -v ".git"`




echo -e "==== st and xdg should be done manually ====\n"
echo -e "Those folders doesn't have an install script:"
for FOLDER in ${NOINSTALL}
do
    echo "- ${FOLDER}"
done
echo -e "You may want to check them individually"
