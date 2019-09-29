#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/nvim"
YAY="yay -S --needed"

echo -e "Installing nvim..\n"
${YAY} neovim gvim vim-runtime

echo -e "Copying config..\n"
mkdir -p ${FOL}
ln ${BASEDIR}/config.ini ${FOL}

echo -e "Installing plugin..\n"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c "PlugInstall" -c q -c q
vim -c "PlugUpgrade" -c q -c q

echo -e "\nDone"
