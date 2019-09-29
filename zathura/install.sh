#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/zathura"
YAY="yay -S --needed"

echo -e "Installing rofi..\n"
${YAY} zathura zahura-pdf-mupdf

echo -e "Copying config..\n"
mkdir -p ${FOL}
ln ${BASEDIR}/zathurarc ${FOL}

echo -e "\nDone"
