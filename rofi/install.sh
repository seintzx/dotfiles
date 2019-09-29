#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/rofi"

echo -e "Installing rofi..\n"
yay -S rofi rofi-greenclip qalculate-gtk

echo -e "Copying config..\n"
mkdir -p ${FOL}
ln ${BASEDIR}/config ${FOL}

echo -e "\nDone"
