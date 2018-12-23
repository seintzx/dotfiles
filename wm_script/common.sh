#!/usr/bin/env bash

WATTA="${HOME}/.config/wm_script/chips/whatsapp.sh"
SLACK="${HOME}/.config/wm_script/chips/slack.sh"
TRELLO="${HOME}/.config/wm_script/chips/trello.sh"
TUTA="${HOME}/.config/wm_script/chips/tuta.sh"

W2=$(cat ${HOME}/.config/i3/config | \
     grep "set \$ws2" | \
     awk '{printf $3}' | \
     sed 's/"//g')

W7=$(cat ${HOME}/.config/i3/config | \
     grep "set \$ws7" | \
     awk '{printf $3}' | \
     sed 's/"//g')

W8=$(cat ${HOME}/.config/i3/config | \
     grep "set \$ws8" | \
     awk '{printf $3}' | \
     sed 's/"//g')

i3-msg "workspace ${W7}; append_layout ${HOME}/.config/i3/7.json"
i3-msg "workspace ${W8}; append_layout ${HOME}/.config/i3/8.json"
i3-msg "workspace ${W2};"

firefox &

telegram-desktop &
. ${SLACK}
. ${WATTA}

. ${TRELLO}
. ${TUTA}
