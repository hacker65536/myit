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

```console
$ cat /etc/pam.d/common-session
#
# /etc/pam.d/common-session - session-related modules common to all services
#
# This file is included from other service-specific PAM config files,
# and should contain a list of modules that define tasks to be performed
# at the start and end of sessions of *any* kind (both interactive and
# non-interactive).
#
# As of pam 1.0.1-6, this file is managed by pam-auth-update by default.
# To take advantage of this, it is recommended that you configure any
# local modules either before or after the default block, and use
# pam-auth-update to manage selection of other modules.  See
# pam-auth-update(8) for details.

# here are the per-package modules (the "Primary" block)
session [default=1]                     pam_permit.so
# here's the fallback if no module succeeds
session requisite                       pam_deny.so
# prime the stack with a positive return value if there isn't one already;
# this avoids us returning an error just because nothing sets a success code
# since the modules above will each just jump around
session required                        pam_permit.so
# The pam_umask module will set the umask according to the system default in
# /etc/login.defs and user settings, solving the problem of different
# umask settings with different shells, display managers, remote sessions etc.
# See "man pam_umask".
session optional                        pam_umask.so
# and here are more per-package modules (the "Additional" block)
session required        pam_unix.so
session optional        pam_systemd.so
# end of pam-auth-update config
```

```console
$ cat /etc/pam.d/runuser-l
#%PAM-1.0
auth            include         runuser
session         optional        pam_keyinit.so force revoke
-session        optional        pam_systemd.so
session         include         runuser
```
```console
$ cat /etc/pam.d/systemd-user
# This file is part of systemd.
#
# Used by systemd --user instances.

@include common-account

session  required pam_selinux.so close
session  required pam_selinux.so nottys open
session  required pam_loginuid.so
session  required pam_limits.so
@include common-session-noninteractive
session optional pam_systemd.so
```

## amazon linux 2

```
$ cat /etc/system-release
Amazon Linux release 2 (Karoo)
```

```
$ sudo su -
Last login: Wed Dec 12 08:41:57 UTC 2018 on pts/0
```
```
# systemctl --user
Failed to get D-Bus connection: Connection refused
```
```
# /lib/systemd/systemd --user
Trying to run as user instance, but $XDG_RUNTIME_DIR is not set.
```
```
# mkdir -p /run/user/0
# export XDG_RUNTIME_DIR=/run/user/0
```

```
# /lib/systemd/systemd --user &
[1] 10199
Startup finished in 2ms.
```

```
# systemctl --user status
● ip-10-0-0-24.us-west-2.compute.internalmy.local
    State: running
     Jobs: 0 queued
   Failed: 0 units
    Since: Wed 2018-12-12 08:53:38 UTC; 3min 33s ago
   CGroup: /user.slice/user-1000.slice/session-4.scope
           ├─10304 sshd: ec2-user [priv
           ├─10322 sshd: ec2-user@pts/0
           ├─10323 -bash
           ├─10407 /lib/systemd/systemd --user
           ├─10459 sudo su -
           ├─10460 su -
           ├─10461 -bash
           ├─10485 systemctl --user status
           └─10486 less
```
