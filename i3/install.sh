#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/i3"

echo -e "Installing i3..\n"
yay -S i3-gaps i3lock i3status
yay -S py3status python-tzlocal python-pytz python-pydbus python-dbus

echo -e "Copying config..\n"
mkdir -p ${FOL}
ln ${BASEDIR}/7.json ${FOL}
ln ${BASEDIR}/8.json ${FOL}
ln ${BASEDIR}/config ${FOL}
ln ${BASEDIR}/py3.conf ${FOL}

echo -e "\nDone"
