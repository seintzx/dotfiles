# yay

## installation

Check out [yay here](https://github.com/Jguer/yay).
```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## configuration

This folder contains the config file for `yay`, an AUR helper.

uncomment those lines in `/etc/pacman.conf`
- `Color`
- `TotalDownload`
- `CheckSpace`
- `VerbosePkgLists`



path to file:
- `~/.config/yay/config.json`
