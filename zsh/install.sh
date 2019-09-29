#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)
FOL="${HOME}"
CFOL="${HOME}.oh-my-zsh/custom"
YAY="yay -S --needed"

echo -e "Installing rofi..\n"
${YAY} zsh

echo -e "Installing oh-my-zsh\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "Installing theme and plugins\n"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

( cd $ZSH_CUSTOM/plugins && git clone https://github.com/chrissicool/zsh-256color )

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "Copying config..\n"
rm ${FOL}/.zshrc
ln ${BASEDIR}/zshrc ${FOL}/.zshrc

ln ${BASEDIR}/alias.zsh ${CFOL}
ln ${BASEDIR}/export.zsh ${CFOL}
ln ${BASEDIR}/keybind.zsh ${CFOL}

echo -e "\nDone"
