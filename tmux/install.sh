#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)

echo -e "Installing tmux..\n"
yay -S tmux

echo -e "Copying config..\n"
ln ${BASEDIR}/tmux.conf ${HOME}/.tmux.conf

echo -e "\nDone"
