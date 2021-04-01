# Odroid C2

This folder contains some basic configuration file for `vim` editor and `bash`
that I use on my board pc (raspberry PI and Odroid C2)

## static ip

Follow
[this](https://www.ostechnix.com/configure-static-dynamic-ip-address-arch-linux/)
and use the `systemd` method

## odroid media server

### auto mount external device

Add to `/etc/fstab`
```
/dev/sda1   /mnt/hdd    ntfs-3g uid=transmission,gid=users,umask=0022   0   0
```

### minidlna

follow [this](https://wiki.archlinux.org/index.php/ReadyMedia), config file can
be found in my config repo

### vpn

`pacman -S openvpn openssl easy-rsa`

- [working script](https://github.com/angristan/openvpn-install)

### docker-compose

[this](https://8gwifi.org/dc1.jsp) will help you covnert docker commands into `docker-compose.yml` file