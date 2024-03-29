#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/networkmanager-dmenu"
YAY="yay -S --needed"

echo -e "Installing networkmanager-dmenu..\n"
${YAY} networkmanager-dmenu

echo -e "Copying config..\n"
mkdir -p ${FOL}
ln ${BASEDIR}/config.ini ${FOL}

echo -e "\nDone"
