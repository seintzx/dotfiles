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
yay -S xf86-input-libinput
```

## configuration

This folder contains all the config file for:
- my keyboard (included the alt-caps layout switch)
- touchpad (valid only with `libinput`, i don't think they work with
  `synaptics`)
- my `.xinitrc`

path to file:
- `/etc/X11/xorg.conf.d/00-keyboard.conf`
- `/etc/X11/xorg.conf.d/30-touchpad.conf`
- `~/.xinitrc`
