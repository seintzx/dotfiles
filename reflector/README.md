# reflector

```
yay -S reflector
```

Add pacman hook:

`/etc/pacman.d/hooks/mirrorupgrade.hook`
```
[Trigger]
Operation = Upgrade
Type = Package
Target = pacman-mirrorlist

[Action]
Description = Updating pacman-mirrorlist with reflector and removing pacnew...
When = PostTransaction
Depends = reflector
Exec = /bin/sh -c 'systemctl start reflector.service; if [ -f /etc/pacman.d/mirrorlist.pacnew ]; then rm /etc/pacman.d/mirrorlist.pacnew; fi'
```

## file path

- `/etc/pacman.d/hooks/mirrorupgrade.hook`
- `/etc/xdg/reflector/reflector.conf`

