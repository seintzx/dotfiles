#!/bin/bash

WATTA="${HOME}/.config/wm_script/chips/chat/whatsapp.sh"
SLACK="${HOME}/.config/wm_script/chips/chat/slack.sh"
TRELLO="${HOME}/.config/wm_script/chips/prod/trello.sh"
TUTA="${HOME}/.config/wm_script/chips/mail/tuta.sh"
GMAIL="${HOME}/.config/wm_script/chips/mail/gmail.sh"
GCAL="${HOME}/.config/wm_script/chips/mail/gcal.sh"

# $(cat ${HOME}/.config/i3/config | \
#   grep "set \$ws${NUM}" | \
#   awk '{printf $3}' | \
#   sed 's/"//g")

# W2="2:"
# W7="7:"
# W8="8:"

# i3-msg "workspace ${W7}; append_layout ${HOME}/.config/i3/7.json"
# i3-msg "workspace ${W8}; append_layout ${HOME}/.config/i3/8.json"
# i3-msg "workspace ${W2};"

firefox &

telegram-desktop &
signal-desktop &
# . ${WATTA}
# . ${SLACK}

. ${TRELLO}
. ${TUTA}
# . ${GMAIL}
# . ${GCAL}
