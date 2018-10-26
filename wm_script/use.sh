#!/bin/bash

CHIPS="${HOME}/.config/wm_script/chips/chips.sh"

firefox &
keepassxc &
telegram-desktop &
. ${CHIPS}
signal-desktop &
