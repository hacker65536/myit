```
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

```
# ls -la /etc/systemd/system/cloud-init.target.wants/
total 0
drwxr-xr-x  2 root root 119 Oct  7 22:17 .
drwxr-xr-x 10 root root 264 Oct  7 22:17 ..
lrwxrwxrwx  1 root root  44 Oct  7 22:17 cloud-config.service -> /usr/lib/systemd/system/cloud-config.service
lrwxrwxrwx  1 root root  43 Oct  7 22:17 cloud-final.service -> /usr/lib/systemd/system/cloud-final.service
lrwxrwxrwx  1 root root  48 Oct  7 22:17 cloud-init-local.service -> /usr/lib/systemd/system/cloud-init-local.service
lrwxrwxrwx  1 root root  42 Oct  7 22:17 cloud-init.service -> /usr/lib/systemd/system/cloud-init.service
```

```
# cat /usr/lib/systemd/system/cloud-init-local.service
[Unit]
Description=Initial cloud-init job (pre-networking)
Wants=network-pre.target
After=systemd-remount-fs.service
Before=NetworkManager.service
Before=network-pre.target
Before=shutdown.target
RequiresMountsFor=/var/lib/cloud

[Service]
Type=oneshot
ExecStart=/usr/bin/cloud-init init --local
ExecStart=/bin/touch /run/cloud-init/network-config-ready
RemainAfterExit=yes
TimeoutSec=0

# Output needs to appear in instance console output
StandardOutput=journal+console

[Install]
WantedBy=cloud-init.target
```
