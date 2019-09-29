#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}"
YAY="yay -S --needed"

echo -e "Installing tmux..\n"
${YAY} tmux

echo -e "Copying config..\n"
ln ${BASEDIR}/tmux.conf ${FOL}/.tmux.conf

echo -e "\nDone"
