# reflector

create service:

`/etc/systemd/system/reflector.service`
```
[Unit]
Description=Pacman mirrorlist update
Wants=network-online.target
After=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/bin/reflector --protocol https --latest 30 --number 20 --sort rate --save /etc/pacman.d/mirrorlist

[Install]
RequiredBy=multi-user.target
```

create a timer:

`/etc/systemd/system/reflector.timer`
```
[Unit]
Description=Run reflector weekly

[Timer]
OnCalendar=*-*-* 10:00:00
Persistent=true

[Install]
WantedBy=timers.target
```

```
systemctl enable reflector.service
```
