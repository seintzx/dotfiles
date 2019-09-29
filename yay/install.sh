#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/yay"

echo -e "Installing yay..\n"
P=`pwd`
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ${P}

echo -e "Copying config..\n"
yay --cleanafter --save
# mkdir -p ${FOL}
# ln ${BASEDIR}/config.json ${FOL}

echo -e "\nDone"
