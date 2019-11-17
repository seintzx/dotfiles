# Odroid C2

This folder contains some basic configuration file for `vim` editor and `bash`
that I use on my board pc (raspberry PI and Odroid C2)

## odroid media server

### minidlna

follow [this](https://wiki.archlinux.org/index.php/ReadyMedia), config file can
be found in my config repo

### vpn

`pacman -S openvpn openssl easy-rsa`

- [guide](https://wiki.archlinux.org/index.php/OpenVPN_Checklist_Guide)
- run `openvpn --genkey --secret /etc/openvpn/server/ta.key` on the server
- use `ovpngen.sh` to generate config

