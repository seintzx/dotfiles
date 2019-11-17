# Network

## installation

```bash
yay -S networkmanager
yay -S networkmanager-dmenu-git
yay -S networkmanager-openvpn
yay -S nm-connection-editor
yay -S dnsmasq

systemctl enable NetworkManager --now
```

## configuration

This folder contains instructions and config file for `NetworkManager` combined
with `dnsmasq`, along with some other tools

### NetworkManager

I choose `dnsmasq` as DNS caching tool, to do so create this file:
```
/etc/NetworkManager/conf.d/dns.conf
--------------------------------------------------------------------------------
[main]
dns=dnsmasq
```

Since `NetworkManager` will start his own session of `dnsmasq`, every
configuration you want to use must be put in `/etc/NetworkManager/dnsmasq.d/`

### dnsmasq

IPv6 DNS lookup may be broken, to solve this create this file:
```
/etc/NetworkManager/dnsmasq.d/ipv6_listen.conf
--------------------------------------------------------------------------------
listen-address=::1
```

To enable DNSSEC create this file:
```
/etc/NetworkManager/dnsmasq.d/dnssec.conf
--------------------------------------------------------------------------------
conf-file=/usr/share/dnsmasq/trust-anchors.conf
dnssec
```

### openvpn

To create a VPN connection use `nm-connection-editor` and import the certificate
you want to use


### networkmanager-dmenu

It's a rofi plugin for network connection and VPN

## file path

- `/etc/NetworkManager/conf.d/dns.conf`
- `/etc/NetworkManager/dnsmasq.d/dnssec.conf`
- `/etc/NetworkManager/dnsmasq.d/ipv6_listen.conf`
- `~/.config/networkmanager-dmenu/config.ini`

## troubleshooting

I had wifi periodically disconnecting and found this error in `dmesg`
```
...
ath10k_pci 0000:3b:00.0: failed to synchronize thermal read
...
```

I found the solution in [this
post](https://bbs.archlinux.org/viewtopic.php?id=229808) and i suggest you to
read it to make sure the problem is the same, but long story short the firmware
needed an update so I switched from `linux-firmware` to `linux-firmware-git`
