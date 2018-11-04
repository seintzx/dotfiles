#!/bin/bash

CHIPS="${HOME}/.config/wm_script/chips/chips.sh"

firefox &
megasync &
discord &
signal-desktop &
telegram-desktop &
. ${CHIPS}
