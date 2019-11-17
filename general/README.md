# general

There you can find some file you will need during installation along with some
general tips and trick

## kernel blacklist

To blacklist some kernel module:
```bash
sudo nvim /etc/modprobe.d/modprobe.conf
blacklist psmouse
```

## BIOS update

```bash
yay -S fwupd
sudo fwupdmgr get-updates
sudo fwupdmrg refresh
sudo fwupdmrg update
```

## TTY setting

Those packages are needed for some problems wiht tty fonts and other packages
```bash
yay -S xorg-fonts-misc
yay -S ttf-symbola
yay -S terminus-font
```
