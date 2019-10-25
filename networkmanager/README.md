# networkmanager-dmenu

## installation

```bash
yay -S networkmanager-dmenu-git
yay -S networkmanager-openvpn
yay -S dnsmasq
sudo systemctl disable systemd-resolved.service --now
```

## configuration

This folder contains the config file for `networkmanager-dmenu`, an utility for
rofi for network connection and VPN.

path to file:
- `~/.config/networkmanager-dmenu/config.ini`
- `/etc/NetworkManager/conf.d/dns.conf`
