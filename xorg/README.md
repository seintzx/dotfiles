# xorg

## installation

```bash
yay -S xorg
yay -S xorg-setxkbmap
yay -S xorg-xclock
yay -S xorg-server
yay -S xorg-xinit
yay -S xorg-xrdb
yay -S xorg-twm
yay -S numlockx
yay -S arandr
yay -S xsel
yay -S xclip
yay -S xf86-input-libinput
yay -S terminus-font
```

## configuration

This folder contains all the config file for:
- my keyboard (include the caps as ctrl)
- slock (screen locker)
- touchpad (only with `libinput`, I don't think it works with `synaptics`)
- backlight
- `vconsole.conf` for tty scaling
- `.Xresources` for HiDPI scaling

## file path

- `/etc/X11/xorg.conf.d/00-keyboard.conf`
- `/etc/X11/xorg.conf.d/10-slock.conf`
- `/etc/X11/xorg.conf.d/30-touchpad.conf`
- `/etc/X11/xorg.conf.d/20-intel.conf`
- `/etc/systemd/logind.conf`
- `/etc/vconsole.conf`
- `~/.xinitrc`
- `~/.Xresources`
