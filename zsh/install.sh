#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}"

echo -e "Installing rofi..\n"
yay -S zsh zsh-theme-powerlevel9k fasd zsh-syntax-highlight zsh-autosuggestions

echo -e "Copying config..\n"
ln ${BASEDIR}/zshrc ${FOL}/.zshrc

echo -e "\nDone"
