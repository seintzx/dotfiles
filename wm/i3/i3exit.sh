case "$1" in
    lock)
        $HOME/.config/i3/lockscr.sh
        ;;
    logout)
        i3-msg exit
        ;;
    switch)
        dm-tool switch-to-greeter
        ;;
    suspend)
        systemctl suspend
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 [lock|logout|switch|suspend|reboot|shutdown]"
        exit 2
esac

exit 0
