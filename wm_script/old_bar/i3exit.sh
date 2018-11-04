#!/bin/bash

case "$1" in
    switch)
        dm-tool switch-to-greeter
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 [switch|reboot|shutdown]"
        exit 2
esac

exit 0
