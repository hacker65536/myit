```console
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.1 LTS
Release:        18.04
Codename:       bionic
```

```console
$ systemctl status
● ip-10-0-2-169
    State: running
     Jobs: 0 queued
   Failed: 0 units
    Since: Wed 2018-12-12 07:52:44 UTC; 9min ago
   CGroup: /
           ├─user.slice
           │ └─user-1000.slice
           │   ├─user@1000.service
           │   │ └─init.scope
           │   │   ├─1289 /lib/systemd/systemd --user
           │   │   └─1291 (sd-pam)
           │   └─session-1.scope
           │     ├─1285 sshd: ubuntu [priv]
           │     ├─1399 sshd: ubuntu@pts/0
           │     ├─1403 -bash
           │     ├─1666 systemctl status
           │     └─1667 systemctl status
           ├─init.scope
           │ └─1 /sbin/init
           └─system.slice
             ├─lvm2-lvmetad.service
             │ └─404 /sbin/lvmetad -f
             ├─systemd-timesyncd.service
             │ └─444 /lib/systemd/systemd-timesyncd
             ├─lxcfs.service
             │ └─708 /usr/bin/lxcfs /var/lib/lxcfs/
             ├─snapd.service
             │ └─998 /usr/lib/snapd/snapd
             ├─iscsid.service
             │ ├─735 /sbin/iscsid
             │ └─736 /sbin/iscsid
             ├─dbus.service
             │ └─717 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
             ├─accounts-daemon.service
             │ └─705 /usr/lib/accountsservice/accounts-daemon
             ├─snap.amazon-ssm-agent.amazon-ssm-agent.service
             │ └─1146 /snap/amazon-ssm-agent/495/amazon-ssm-agent
             ├─ssh.service
             │ └─831 /usr/sbin/sshd -D
             ├─system-serial\x2dgetty.slice
             │ └─serial-getty@ttyS0.service
             │   └─766 /sbin/agetty -o -p -- \u --keep-baud 115200,38400,9600 ttyS0 vt220
             ├─system-getty.slice
             │ └─getty@tty1.service
             │   └─775 /sbin/agetty -o -p -- \u --noclear tty1 linux
             ├─networkd-dispatcher.service
             │ └─703 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
             ├─systemd-logind.service
             │ └─709 /lib/systemd/systemd-logind
             ├─systemd-resolved.service
             │ └─566 /lib/systemd/systemd-resolved
             ├─polkit.service
             │ └─750 /usr/lib/policykit-1/polkitd --no-debug
             ├─cron.service
             │ └─706 /usr/sbin/cron -f
             ├─systemd-udevd.service
             │ └─409 /lib/systemd/systemd-udevd
             ├─rsyslog.service
             │ └─729 /usr/sbin/rsyslogd -n
             ├─atd.service
             │ └─731 /usr/sbin/atd -f
             ├─systemd-journald.service
             │ └─392 /lib/systemd/systemd-journald
             └─systemd-networkd.service
               └─550 /lib/systemd/systemd-networkd
```

```console
$ cat /lib/systemd/system/user@.service
#  SPDX-License-Identifier: LGPL-2.1+
#
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=User Manager for UID %i
After=systemd-user-sessions.service

[Service]
User=%i
PAMName=systemd-user
Type=notify
ExecStart=-/lib/systemd/systemd --user
Slice=user-%i.slice
KillMode=mixed
Delegate=pids cpu
TasksMax=infinity
TimeoutStopSec=120s
```

```console
$ cat /lib/systemd/system/user@.service.d/timeout.conf
# Avoid long hangs during shutdown if user services fail/hang due to X.org
# going away too early
[Service]
TimeoutStopSec=5
```
```console
$ grep -r systemd /etc/pam.d/*
/etc/pam.d/common-session:session       optional        pam_systemd.so
/etc/pam.d/runuser-l:-session   optional        pam_systemd.so
/etc/pam.d/systemd-user:# This file is part of systemd.
/etc/pam.d/systemd-user:# Used by systemd --user instances.
/etc/pam.d/systemd-user:session optional pam_systemd.so
```
