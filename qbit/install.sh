#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/qBittorrent"

echo -e "Installing ttorrent..\n"
yay -S qbittorrent

echo -e "Copying config..\n"
mkdir -p ${HOME}/torrent/complete
mkdir -p ${HOME}/torrent/file
mkdir -p ${HOME}/torrent/temp
mkdir -p ${FOL}
ln ${BASEDIR}/qBittorrent.conf ${FOL}

echo -e "\nDone"
