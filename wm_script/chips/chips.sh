#!/bin/bash

TRELLO="${HOME}/.config/wm_script/chips/prod/trello.sh"
GMAIL="${HOME}/.config/wm_script/chips/mail/gmail.sh"
TUTA="${HOME}/.config/wm_script/chips/mail/tuta.sh"
GCAL="${HOME}/.config/wm_script/chips/mail/gcal.sh"
WATTA="${HOME}/.config/wm_script/chips/chat/whatsapp.sh"
SLACK="${HOME}/.config/wm_script/chips/chat/slack.sh"

. ${WATTA}
. ${SLACK}
. ${TRELLO}
. ${GMAIL}
. ${TUTA}
. ${GCAL}
