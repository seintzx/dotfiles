#!/bin/bash

CHIPS="${HOME}/.config/wm_script/chips/chips.sh"

firefox &
signal-desktop &
telegram-desktop &
. ${CHIPS}
