#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/st"

echo -e "Installing st..\n"
yay -S rofi rofi-greenclip qalculate-gtk

echo -e "Copying config..\n"
mkdir -p ${FOL}
ln ${BASEDIR}/config ${FOL}

# idea:
# yay -G st-git
# cd st-git
# cp config.h
# edit PKGBUILD
# makepkg -si




echo -e "\nDone"
