#!/bin/bash

CHIPS="${HOME}/.config/wm_script/chips/chips.sh"

firefox &
keepassxc &
signal-desktop &
telegram-desktop &
. ${CHIPS}
