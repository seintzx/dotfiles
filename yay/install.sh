#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/yay"

echo -e "Installing yay..\n"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay

echo -e "Copying config..\n"
yay --cleanafter --save
# mkdir -p ${FOL}
# ln ${BASEDIR}/config.json ${FOL}

echo -e "\nDone"
