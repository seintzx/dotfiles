#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="/etc/X11/xorg.conf.d"
YAY="yay -S --needed"

echo -e "Installing xorg..\n"
${YAY} xorg xorg-setxkbmap xorg-xclock \
    xorg-server xorg-xinit xorg-xrdb \
    xorg-twm numlockx arandr \
    xsel xf86-input-libinput terminus-font

echo -e "Copying config..\n"
echo -e "Some commands will be run as root\n"
sudo ln ${BASEDIR}/00-keyboard.conf ${FOL}
sudo ln ${BASEDIR}/20-intel.conf ${FOL}
sudo ln ${BASEDIR}/30-touchpad.conf ${FOL}
sudo ln ${BASEDIR}/vconsole.conf /etc/vconsole.conf
ln ${BASEDIR}/xinitrc ${HOME}/.xinitrc
ln ${BASEDIR}/Xresources ${HOME}/.Xresources

echo -e "\nDone"
