
#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}/.config/awesome"
YAY="yay -S --needed"

echo -e "Installing awesome..\n"
${YAY} awesome lain-git sp

echo -e "Copying config..\n"
mkdir -p ${FOL}

cp -r ${BASEDIR}/icons ${FOL}
ln ${BASEDIR}/rc.lua ${FOL}
ln ${BASEDIR}/theme.lua ${FOL}

echo -e "\nDone"
