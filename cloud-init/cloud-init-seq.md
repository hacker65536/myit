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

```console
# ls -la /etc/systemd/system/cloud-init.target.wants/
total 0
drwxr-xr-x  2 root root 119 Oct  7 22:17 .
drwxr-xr-x 10 root root 264 Oct  7 22:17 ..
lrwxrwxrwx  1 root root  44 Oct  7 22:17 cloud-config.service -> /usr/lib/systemd/system/cloud-config.service
lrwxrwxrwx  1 root root  43 Oct  7 22:17 cloud-final.service -> /usr/lib/systemd/system/cloud-final.service
lrwxrwxrwx  1 root root  48 Oct  7 22:17 cloud-init-local.service -> /usr/lib/systemd/system/cloud-init-local.service
lrwxrwxrwx  1 root root  42 Oct  7 22:17 cloud-init.service -> /usr/lib/systemd/system/cloud-init.service
```

```console
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

```console
# cat /usr/bin/cloud-init
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

```console
# cat /usr/lib/python2.7/site-packages/cloud_init-18.2-py2.7.egg-info/entry_points.txt
[console_scripts]
cloud-init = cloudinit.cmd.main:main
```

`/var/log/cloud-init.log`
```
  1 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Cloud-init v. 18.2-72.amzn2.0.6 running 'init-local' at Wed, 10 Oct 2018 00:52:35 +0000. Up 5.33 seconds.
  2 Oct 10 00:52:35 cloud-init[2662]: main.py[DEBUG]: No kernel command line url found.
  3 Oct 10 00:52:35 cloud-init[2662]: main.py[DEBUG]: Closing stdin.
  4 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Writing to /var/log/cloud-init.log - ab: [644] 0 bytes
  5 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Attempting to remove /var/lib/cloud/instance/boot-finished
  6 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Attempting to remove /var/lib/cloud/data/no-net
  7 Oct 10 00:52:35 cloud-init[2662]: handlers.py[DEBUG]: start: init-local/check-cache: attempting to read from cache [check]
  8 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Reading from /var/lib/cloud/instance/obj.pkl (quiet=False)
  9 Oct 10 00:52:35 cloud-init[2662]: stages.py[DEBUG]: no cache found
 10 Oct 10 00:52:35 cloud-init[2662]: handlers.py[DEBUG]: finish: init-local/check-cache: SUCCESS: no cache found
 11 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Attempting to remove /var/lib/cloud/instance
 12 Oct 10 00:52:35 cloud-init[2662]: stages.py[DEBUG]: Using distro class <class 'cloudinit.distros.amazon.Distro'>
 13 Oct 10 00:52:35 cloud-init[2662]: __init__.py[DEBUG]: Looking for data source in: ['Ec2', 'None'], via packages ['', u'cloudinit.sources'] that matches dependencies ['FILESYSTEM']
 14 Oct 10 00:52:35 cloud-init[2662]: __init__.py[DEBUG]: Searching for local data source in: []
 15 Oct 10 00:52:35 cloud-init[2662]: main.py[DEBUG]: No local datasource found
 16 Oct 10 00:52:35 cloud-init[2662]: stages.py[DEBUG]: network config disabled by system_cfg
 17 Oct 10 00:52:35 cloud-init[2662]: stages.py[INFO]: network config is disabled by system_cfg
 18 Oct 10 00:52:35 cloud-init[2662]: main.py[DEBUG]: [local] Exiting without datasource in local mode
 19 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Reading from /proc/uptime (quiet=False)
 20 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Read 10 bytes from /proc/uptime
 21 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: cloud-init mode 'init' took 0.058 seconds (0.06)
 22 Oct 10 00:52:35 cloud-init[2662]: handlers.py[DEBUG]: finish: init-local: SUCCESS: searching for local datasources
```

 `/usr/lib/python2.7/site-packages/cloudinit/cmd/main.py`
```
280     mode = sources.DSMODE_LOCAL if args.local else sources.DSMODE_NETWORK
```
```
335         if mode == sources.DSMODE_LOCAL:
336             LOG.debug("No local datasource found")
337         else:
338             util.logexc(LOG, ("No instance datasource found!"
339                               " Likely bad things to come!"))
340         if not args.force:
341             init.apply_network_config(bring_up=not args.local)
342             LOG.debug("[%s] Exiting without datasource in local mode", mode)
343             if mode == sources.DSMODE_LOCAL:
344                 return (None, [])
345             else:
346                 return (None, ["No instance datasource found."])
347         else:
348             LOG.debug("[%s] barreling on in force mode without datasource",
349                       mode)
```

`/var/log/cloud-init.log`
```
 23 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Cloud-init v. 18.2-72.amzn2.0.6 running 'init' at Wed, 10 Oct 2018 00:52:37 +0000. Up 7.65 seconds.
 24 Oct 10 00:52:37 cloud-init[3038]: main.py[DEBUG]: No kernel command line url found.
 25 Oct 10 00:52:37 cloud-init[3038]: main.py[DEBUG]: Closing stdin.
 26 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Writing to /var/log/cloud-init.log - ab: [644] 0 bytes
 27 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Running command ['ip', 'addr', 'show'] with allowed return codes [0] (shell=False, capture=True)
 28 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Running command ['ip', '-o', 'route', 'list'] with allowed return codes [0] (shell=False, capture=True)
 29 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Running command ['ip', '--oneline', '-6', 'route', 'list', 'table', 'all'] with allowed return codes [0, 1] (shell=False, capture=True)
 30 Oct 10 00:52:37 cloud-init[3038]: main.py[DEBUG]: Checking to see if files that we need already exist from a previous run that would allow us to stop early.
 31 Oct 10 00:52:37 cloud-init[3038]: main.py[DEBUG]: Execution continuing, no previous run detected that would allow us to stop early.
 32 Oct 10 00:52:37 cloud-init[3038]: handlers.py[DEBUG]: start: init-network/check-cache: attempting to read from cache [trust]
 33 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Reading from /var/lib/cloud/instance/obj.pkl (quiet=False)
 34 Oct 10 00:52:37 cloud-init[3038]: stages.py[DEBUG]: no cache found
 35 Oct 10 00:52:37 cloud-init[3038]: handlers.py[DEBUG]: finish: init-network/check-cache: SUCCESS: no cache found
```
