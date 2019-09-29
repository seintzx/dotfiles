#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/wm_script"

echo -e "Installing wm_script..\n"

echo -e "Copying config..\n"
mkdir -p ${FOL}/chips
ln ${BASEDIR}/chips/* ${FOL}/chips
ln ${BASEDIR}/common.sh ${FOL}
ln ${BASEDIR}/lockscr.sh ${FOL}
ln ${BASEDIR}/startup.sh ${FOL}

echo -e "\nDone"
