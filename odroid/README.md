# Odroid C2

This folder contains some basic configuration file for `vim` editor and `bash`
that I use on my board pc (raspberry PI and Odroid C2)

## static ip

Follow
[this](https://www.ostechnix.com/configure-static-dynamic-ip-address-arch-linux/)
and use the `systemd` method

## odroid media server

### minidlna

follow [this](https://wiki.archlinux.org/index.php/ReadyMedia), config file can
be found in my config repo

### vpn

`pacman -S openvpn openssl easy-rsa`

- [working script](https://github.com/angristan/openvpn-install)
