#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)

echo -e "Copying config..\n"
ln ${BASEDIR}/gitconfig ${HOME}/.gitconfig
echo -e "\nDone"
