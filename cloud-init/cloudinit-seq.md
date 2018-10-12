
systemdからcloud-initの起動順番を確認
```console
# systemd-analyze critical-chain
The time after the unit is active or started is printed after the "@" character.
The time the unit takes to start is printed after the "+" character.

graphical.target @10.330s
└─multi-user.target @10.330s
  └─sshd.service @6.108s +15ms
    └─sshd-keygen.service @5.070s +559ms
      └─cloud-init.service @3.748s +1.321s
        └─network.service @1.987s +1.760s
          └─network-pre.target @1.986s
            └─cloud-init-local.service @1.299s +686ms
              └─basic.target @1.263s
                └─sockets.target @1.263s
                  └─dbus.socket @1.262s
                    └─sysinit.target @1.257s
                      └─systemd-update-utmp.service @1.244s +12ms
                        └─auditd.service @1.102s +141ms
                          └─systemd-tmpfiles-setup.service @1.084s +16ms
                            └─local-fs.target @1.068s
                              └─local-fs-pre.target @1.068s
                                └─lvm2-monitor.service @212ms +855ms
                                  └─lvm2-lvmetad.service @272ms
                                    └─lvm2-lvmetad.socket @212ms
                                      └─-.slice
```

`cloud-init-local.service @1.299s +686ms`  
- 起動に686msを要した
- basic.targetより後に呼ばれている

```console
$ ls -la /etc/systemd/system/cloud-init.target.wants/cloud-init.service
lrwxrwxrwx 1 root root 42 Oct  7 22:17 /etc/systemd/system/cloud-init.target.wants/cloud-init.service -> /usr/lib/systemd/system/cloud-init.service
```

実態は`/usr/lib/systemd/system/cloud-init.service`である

中身  
```console
$ cat /usr/lib/systemd/system/cloud-init.service
[Unit]
Description=Initial cloud-init job (metadata service crawler)
DefaultDependencies=no
Wants=cloud-init-local.service
Wants=sshd-keygen.service
Wants=sshd.service
After=cloud-init-local.service
After=systemd-networkd-wait-online.service
After=network.service
Before=network-online.target
Before=sshd-keygen.service
Before=sshd.service
Before=systemd-user-sessions.service

[Service]
Type=oneshot
ExecStart=/usr/bin/cloud-init init
RemainAfterExit=yes
TimeoutSec=0

# Output needs to appear in instance console output
StandardOutput=journal+console

[Install]
WantedBy=cloud-init.target
```

`/usr/bin/cloud-init init`が呼ばれている  
そして中身
```console
$ cat /usr/bin/cloud-init
```

```python
#!/usr/bin/python
# EASY-INSTALL-ENTRY-SCRIPT: 'cloud-init==18.2','console_scripts','cloud-init'
__requires__ = 'cloud-init==18.2'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('cloud-init==18.2', 'console_scripts', 'cloud-init')()
    )
```
