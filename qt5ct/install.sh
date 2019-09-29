#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/qt5ct"

echo -e "Installing qt5ct..\n"
yay -S qt5ct

echo -e "Copying config..\n"
mkdir -p ${FOL}
ln ${BASEDIR}/qt5ct.conf ${FOL}

echo -e "\nDone"
