#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}"

echo -e "Copying config..\n"
ln ${BASEDIR}/gitconfig ${FOL}/.gitconfig
echo -e "\nDone"
