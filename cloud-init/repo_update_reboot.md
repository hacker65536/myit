amzlinux
------------
```yml
#cloud-config

repo_update: true
repo_upgrade: all
timezone: "Asia/Tokyo"
power_state:
 mode: reboot
```

centos
---------------
```yml
#cloud-config
disable_root: False
bootcmd:
 - setenforce 0
package_update: true
package_upgrade: true
```


```
[root@ip-172-31-21-15 log]# cat /etc/redhat-release
CentOS Linux release 7.4.1708 (Core)

[root@ip-172-31-21-15 ~]# cat /var/lib/cloud/instance/user-data.txt.i && echo
From nobody Wed Nov  1 03:09:04 2017
Content-Type: multipart/mixed; boundary="===============3114456483150903833=="
MIME-Version: 1.0
Number-Attachments: 1

--===============3114456483150903833==
MIME-Version: 1.0
Content-Type: text/cloud-config
Content-Disposition: attachment; filename="part-001"

#cloud-config
disable_root: False
bootcmd:
 - setenforce 0
package_update: true
package_upgrade: true

--===============3114456483150903833==--
[root@ip-172-31-21-15 ~]# journalctl _PID=1121 -n 10
-- Logs begin at Wed 2017-11-01 03:08:53 UTC, end at Wed 2017-11-01 03:37:39 UTC. --
Nov 01 03:09:55 ip-172-31-21-15.us-east-2.compute.internal yum[1121]: Updated: kexec-tools-2.0.14-17.2.el7.x86_64
Nov 01 03:09:55 ip-172-31-21-15.us-east-2.compute.internal yum[1121]: Updated: nss-tools-3.28.4-15.el7_4.x86_64
Nov 01 03:10:07 ip-172-31-21-15.us-east-2.compute.internal yum[1121]: Updated: selinux-policy-targeted-3.13.1-166.el7_4.5.noarch
Nov 01 03:10:07 ip-172-31-21-15.us-east-2.compute.internal yum[1121]: Installed: 1:grub2-2.02-0.65.el7.centos.2.x86_64
Nov 01 03:10:07 ip-172-31-21-15.us-east-2.compute.internal yum[1121]: Updated: openssh-clients-7.4p1-13.el7_4.x86_64
Nov 01 03:10:07 ip-172-31-21-15.us-east-2.compute.internal yum[1121]: Updated: iptables-1.4.21-18.2.el7_4.x86_64
Nov 01 03:10:07 ip-172-31-21-15.us-east-2.compute.internal yum[1121]: Updated: sudo-1.8.19p2-11.el7_4.x86_64
Nov 01 03:10:07 ip-172-31-21-15.us-east-2.compute.internal yum[1121]: Updated: ncurses-5.9-14.20130511.el7_4.x86_64
Nov 01 03:10:08 ip-172-31-21-15.us-east-2.compute.internal yum[1121]: Updated: python-perf-3.10.0-693.5.2.el7.x86_64
Nov 01 03:10:08 ip-172-31-21-15.us-east-2.compute.internal yum[1121]: Updated: tzdata-2017c-1.el7.noarch
```
