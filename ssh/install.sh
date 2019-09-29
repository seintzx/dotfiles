#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.ssh"
YAY="yay -S --needed"

echo -e "Installing rofi..\n"
${YAY} openssh

echo -e "Copying config..\n"
mkdir -p ${FOL}
ln ${BASEDIR}/config ${FOL}

echo -e "\nDone"
