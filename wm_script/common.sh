#!/bin/bash

CHIPS="${HOME}/.config/wm_script/chips/chips.sh"

firefox &
megasync &
signal-desktop &
telegram-desktop &
. ${CHIPS}
