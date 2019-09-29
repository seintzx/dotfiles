#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/dunst"

echo -e "Installing dunst..\n"
# yay -S dunst

echo -e "Copying config..\n"
mkdir -p ${FOL}
ln ${BASEDIR}/dunstrc ${FOL}
ln ${BASEDIR}/reload.sh ${FOL}

echo -e "\nDone"
