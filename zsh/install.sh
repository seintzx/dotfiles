#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}"
YAY="yay -S --needed"

echo -e "Installing rofi..\n"
${YAY} zsh zsh-theme-powerlevel9k fasd zsh-syntax-highlight zsh-autosuggestions

echo -e "Copying config..\n"
ln ${BASEDIR}/zshrc ${FOL}/.zshrc

echo -e "\nDone"
