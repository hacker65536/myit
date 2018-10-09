
# amazonlinux2


## /var/log/message

first appearance of systemd
```
 279 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: Inserted module 'autofs4'
 280 Oct  9 02:44:00 ip-10-0-0-189 kernel: NET: Registered protocol family 10
 281 Oct  9 02:44:00 ip-10-0-0-189 kernel: Segment Routing with IPv6
 282 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: Inserted module 'ipv6'
 283 Oct  9 02:44:00 ip-10-0-0-189 kernel: random: systemd: uninitialized urandom read (16 bytes read)
 284 Oct  9 02:44:00 ip-10-0-0-189 kernel: random: systemd: uninitialized urandom read (16 bytes read)
 285 Oct  9 02:44:00 ip-10-0-0-189 kernel: random: systemd: uninitialized urandom read (16 bytes read)
 286 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: systemd 219 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 -SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
 287 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: Detected virtualization xen.
 288 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: Detected architecture x86-64.
 289 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: Running in initial RAM disk.
 290 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: No hostname configured.
 291 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: Set hostname to <localhost>.
 292 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: Initializing machine ID from random generator.
 293 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: Reached target Timers.
 294 Oct  9 02:44:00 ip-10-0-0-189 systemd[1]: Starting Timers.
```
first appearance of cloud-init
```
 560 Oct  9 02:44:04 ip-10-0-0-189 systemd: Starting libstoragemgmt plug-in server daemon...
 561 Oct  9 02:44:04 ip-10-0-0-189 systemd: Starting NTP client/server...
 562 Oct  9 02:44:04 ip-10-0-0-189 systemd: Starting Initial cloud-init job (pre-networking)...
 563 Oct  9 02:44:04 ip-10-0-0-189 systemd: Started Hardware RNG Entropy Gatherer Daemon.
 564 Oct  9 02:44:04 ip-10-0-0-189 systemd: Starting Hardware RNG Entropy Gatherer Daemon...
 565 Oct  9 02:44:04 ip-10-0-0-189 systemd: Starting Login Service...
 566 Oct  9 02:44:04 ip-10-0-0-189 systemd: Starting Resets System Activity Logs...
```
driver
```
 309 Oct  9 02:44:01 ip-10-0-0-189 systemd: Starting udev Kernel Device Manager...
 310 Oct  9 02:44:01 ip-10-0-0-189 systemd-udevd: starting version 219
 311 Oct  9 02:44:01 ip-10-0-0-189 systemd-udevd: Network interface NamePolicy= disabled on kernel command line, ignoring.
 312 Oct  9 02:44:01 ip-10-0-0-189 systemd: Started udev Kernel Device Manager.
 313 Oct  9 02:44:01 ip-10-0-0-189 systemd: Starting dracut pre-trigger hook...
 314 Oct  9 02:44:01 ip-10-0-0-189 systemd: Started dracut pre-trigger hook.
 315 Oct  9 02:44:01 ip-10-0-0-189 systemd: Starting udev Coldplug all Devices...
 316 Oct  9 02:44:01 ip-10-0-0-189 systemd-udevd: Network interface NamePolicy= disabled on kernel command line, ignoring.
 317 Oct  9 02:44:01 ip-10-0-0-189 systemd: Started udev Coldplug all Devices.
 318 Oct  9 02:44:01 ip-10-0-0-189 systemd: Reached target System Initialization.
 319 Oct  9 02:44:01 ip-10-0-0-189 systemd: Starting System Initialization.
 320 Oct  9 02:44:01 ip-10-0-0-189 systemd: Starting Show Plymouth Boot Screen...
 321 Oct  9 02:44:01 ip-10-0-0-189 systemd: Starting dracut initqueue hook...
 322 Oct  9 02:44:01 ip-10-0-0-189 systemd: Received SIGRTMIN+20 from PID 1695 (plymouthd).
```

network
```
 587 Oct  9 02:44:04 ip-10-0-0-189 systemd: Started NTP client/server.
 588 Oct  9 02:44:05 ip-10-0-0-189 cloud-init: Cloud-init v. 18.2-72.amzn2.0.6 running 'init-local' at Tue, 09 Oct 2018 02:44:05 +0000. Up 6.46 seconds.
 589 Oct  9 02:44:05 ip-10-0-0-189 systemd: Started Initial cloud-init job (pre-networking).
 590 Oct  9 02:44:05 ip-10-0-0-189 systemd: Reached target Network (Pre).
 591 Oct  9 02:44:05 ip-10-0-0-189 systemd: Starting Network (Pre).
 592 Oct  9 02:44:05 ip-10-0-0-189 systemd: Starting LSB: Bring up/down networking...
 593 Oct  9 02:44:05 ip-10-0-0-189 network: Bringing up loopback interface:  [  OK  ]
 594 Oct  9 02:44:05 ip-10-0-0-189 network: Bringing up interface eth0:
 595 Oct  9 02:44:05 ip-10-0-0-189 dhclient[2822]: DHCPDISCOVER on eth0 to 255.255.255.255 port 67 interval 8 (xid=0x2af6d56c)
 596 Oct  9 02:44:05 ip-10-0-0-189 dhclient[2822]: DHCPREQUEST on eth0 to 255.255.255.255 port 67 (xid=0x2af6d56c)
 597 Oct  9 02:44:05 ip-10-0-0-189 dhclient[2822]: DHCPOFFER from 10.0.0.1
 598 Oct  9 02:44:05 ip-10-0-0-189 dhclient[2822]: DHCPACK from 10.0.0.1 (xid=0x2af6d56c)
 599 Oct  9 02:44:05 ip-10-0-0-189 NET[2866]: /usr/sbin/dhclient-script : updated /etc/resolv.conf
 600 Oct  9 02:44:05 ip-10-0-0-189 dhclient[2822]: bound to 10.0.0.189 -- renewal in 1715 seconds.
 601 Oct  9 02:44:05 ip-10-0-0-189 network: Determining IP information for eth0... done.
 602 Oct  9 02:44:05 ip-10-0-0-189 ec2net: [get_meta] Trying to get http://169.254.169.254/latest/meta-data/network/interfaces/macs/02:b4:ea:29:3d:58/local-ipv4s
 603 Oct  9 02:44:05 ip-10-0-0-189 ec2net: [rewrite_aliases] Rewriting aliases of eth0
 604 Oct  9 02:44:07 ip-10-0-0-189 network: Determining IPv6 information for eth0... done.
 605 Oct  9 02:44:07 ip-10-0-0-189 network: [  OK  ]
 606 Oct  9 02:44:07 ip-10-0-0-189 systemd: Started LSB: Bring up/down networking.
 607 Oct  9 02:44:07 ip-10-0-0-189 systemd: Reached target Network.
 608 Oct  9 02:44:07 ip-10-0-0-189 systemd: Starting Network.
 609 Oct  9 02:44:07 ip-10-0-0-189 systemd: Starting Postfix Mail Transport Agent...
```

## systemd
```
# systemctl list-dependencies
default.target
● ├─display-manager.service
● ├─network.service
● ├─systemd-readahead-collect.service
● ├─systemd-readahead-replay.service
● ├─systemd-update-utmp-runlevel.service
● └─multi-user.target
●   ├─amazon-ssm-agent.service
●   ├─atd.service
●   ├─auditd.service
●   ├─brandbot.path
●   ├─chronyd.service
●   ├─crond.service
●   ├─dbus.service
●   ├─irqbalance.service
●   ├─libstoragemgmt.service
●   ├─mdmonitor.service
●   ├─network.service
●   ├─plymouth-quit-wait.service
●   ├─plymouth-quit.service
●   ├─postfix.service
●   ├─rngd.service
●   ├─rpcbind.service
●   ├─rsyslog.service
●   ├─sshd.service
●   ├─sysstat.service
●   ├─systemd-ask-password-wall.path
●   ├─systemd-logind.service
●   ├─systemd-update-utmp-runlevel.service
●   ├─systemd-user-sessions.service
●   ├─update-motd.service
●   ├─basic.target
●   │ ├─rhel-autorelabel-mark.service
●   │ ├─rhel-autorelabel.service
●   │ ├─rhel-configure.service
●   │ ├─rhel-dmesg.service
●   │ ├─rhel-loadmodules.service
●   │ ├─selinux-policy-migrate-local-changes@targeted.service
●   │ ├─paths.target
●   │ ├─slices.target
●   │ │ ├─-.slice
●   │ │ └─system.slice
●   │ ├─sockets.target
●   │ │ ├─dbus.socket
●   │ │ ├─dm-event.socket
●   │ │ ├─rpcbind.socket
●   │ │ ├─systemd-initctl.socket
●   │ │ ├─systemd-journald.socket
●   │ │ ├─systemd-shutdownd.socket
●   │ │ ├─systemd-udevd-control.socket
●   │ │ └─systemd-udevd-kernel.socket
●   │ ├─sysinit.target
●   │ │ ├─dev-hugepages.mount
●   │ │ ├─dev-mqueue.mount
●   │ │ ├─dmraid-activation.service
●   │ │ ├─kmod-static-nodes.service
●   │ │ ├─lvm2-lvmetad.socket
●   │ │ ├─lvm2-lvmpolld.socket
●   │ │ ├─lvm2-monitor.service
●   │ │ ├─plymouth-read-write.service
●   │ │ ├─plymouth-start.service
●   │ │ ├─proc-sys-fs-binfmt_misc.automount
●   │ │ ├─sys-fs-fuse-connections.mount
●   │ │ ├─sys-kernel-config.mount
●   │ │ ├─sys-kernel-debug.mount
●   │ │ ├─systemd-ask-password-console.path
●   │ │ ├─systemd-binfmt.service
●   │ │ ├─systemd-firstboot.service
●   │ │ ├─systemd-hwdb-update.service
●   │ │ ├─systemd-journal-catalog-update.service
●   │ │ ├─systemd-journal-flush.service
●   │ │ ├─systemd-journald.service
●   │ │ ├─systemd-machine-id-commit.service
●   │ │ ├─systemd-modules-load.service
●   │ │ ├─systemd-random-seed.service
●   │ │ ├─systemd-sysctl.service
●   │ │ ├─systemd-tmpfiles-setup-dev.service
●   │ │ ├─systemd-tmpfiles-setup.service
●   │ │ ├─systemd-udev-trigger.service
●   │ │ ├─systemd-udevd.service
●   │ │ ├─systemd-update-done.service
●   │ │ ├─systemd-update-utmp.service
●   │ │ ├─systemd-vconsole-setup.service
●   │ │ ├─cryptsetup.target
●   │ │ ├─local-fs.target
●   │ │ │ ├─-.mount
●   │ │ │ ├─rhel-import-state.service
●   │ │ │ ├─rhel-readonly.service
●   │ │ │ ├─systemd-fsck-root.service
●   │ │ │ └─systemd-remount-fs.service
●   │ │ └─swap.target
●   │ └─timers.target
●   │   └─systemd-tmpfiles-clean.timer
●   ├─cloud-init.target
●   │ ├─cloud-config.service
●   │ ├─cloud-final.service
●   │ ├─cloud-init-local.service
●   │ └─cloud-init.service
●   ├─getty.target
●   │ ├─getty@tty1.service
●   │ └─serial-getty@ttyS0.service
●   ├─nfs-client.target
●   │ ├─auth-rpcgss-module.service
●   │ ├─rpc-statd-notify.service
●   │ └─remote-fs-pre.target
●   └─remote-fs.target
●     └─nfs-client.target
●       ├─auth-rpcgss-module.service
●       ├─rpc-statd-notify.service
●       └─remote-fs-pre.target
```
