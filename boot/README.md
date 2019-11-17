# boot

This part is well covered in my installation guide, I just saved here some file
for recovery purpose

## kernel blacklist

To blacklist some kernel module:
```
sudo nvim /etc/modprobe.d/modprobe.conf
blacklist psmouse
```

## BIOS update

```
yay -S fwupd
sudo fwupdmgr get-updates
sudo fwupdmrg refresh
sudo fwupdmrg update
```

## TTY setting

Those packages are needed for some problems wiht tty fonts and other packages
```
yay -S xorg-fonts-misc
yay -S ttf-symbola
yay -S terminus-font
```
