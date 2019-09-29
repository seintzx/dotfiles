#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/gtk-3.0"
YAY="yay -S --needed"

echo -e "Installing gtk..\n"
${YAY} gtk3

echo -e "Copying config..\n"
mkdir -p ${FOL}

ln ${BASEDIR}/gtkrc-2.0 ${HOME}/.gtkrc-2.0
ln ${BASEDIR}/gtk-3.0/settings.ini ${FOL}

echo -e "\nDone"
