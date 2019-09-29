#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}"

echo -e "Installing tmux..\n"
yay -S tmux

echo -e "Copying config..\n"
ln ${BASEDIR}/tmux.conf ${FOL}/.tmux.conf

echo -e "\nDone"
