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

## find installed packages

> "One command to rule them all, One command to find them, One command to bring
> them all, and in the darkness install them."

```bash
pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 !="base-devel" ) { print name } }'
```

This command will list all the packages you have explicitly installed, even the
one from _AUR_. [Source](https://bbs.archlinux.org/viewtopic.php?pid=690438).

Or you can use the older version:
- `yay -Qqem` list packages from AUR
- `yay -Qqen` list packages not from AUR
