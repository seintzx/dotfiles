#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.ssh"

echo -e "Installing rofi..\n"
yay -S openssh

echo -e "Copying config..\n"
mkdir -p ${FOL}
ln ${BASEDIR}/config ${FOL}

echo -e "\nDone"
