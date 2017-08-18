https://help.github.com/enterprise/2.10/admin/guides/installation/installing-github-enterprise-on-aws/


```
$ aws ec2 describe-images --owners 895557238572 --query 'sort_by(Images,&Name)[*].{Name:Name,ImageID:ImageId}' --output=text --region us-east-2
ami-40103625	GitHub Enterprise 2.10.0
ami-89af89ec	GitHub Enterprise 2.10.1
ami-e89eb88d	GitHub Enterprise 2.10.2
ami-f3d9f896	GitHub Enterprise 2.10.3
ami-fa18389f	GitHub Enterprise 2.10.4
ami-ba4b11df	GitHub Enterprise 2.8.0
ami-1b4f157e	GitHub Enterprise 2.8.1
ami-39e5c15c	GitHub Enterprise 2.8.10
ami-be6d4adb	GitHub Enterprise 2.8.11
ami-ed0c2b88	GitHub Enterprise 2.8.12
ami-16a08773	GitHub Enterprise 2.8.13
ami-8d2c0ae8	GitHub Enterprise 2.8.14
ami-a99cbacc	GitHub Enterprise 2.8.15
ami-8fd8f9ea	GitHub Enterprise 2.8.16
ami-2e19394b	GitHub Enterprise 2.8.17
ami-7899c31d	GitHub Enterprise 2.8.2
ami-bc97cdd9	GitHub Enterprise 2.8.3
ami-6ec3990b	GitHub Enterprise 2.8.4
ami-a2edb7c7	GitHub Enterprise 2.8.5
ami-a07055c5	GitHub Enterprise 2.8.6
ami-f3381d96	GitHub Enterprise 2.8.7
ami-0383a666	GitHub Enterprise 2.8.8
ami-8c5672e9	GitHub Enterprise 2.8.9
ami-d081a4b5	GitHub Enterprise 2.9.0
ami-da4b6fbf	GitHub Enterprise 2.9.1
ami-d3e7c3b6	GitHub Enterprise 2.9.2
ami-a96146cc	GitHub Enterprise 2.9.3
ami-b80126dd	GitHub Enterprise 2.9.4
ami-15a08770	GitHub Enterprise 2.9.5
ami-222a0c47	GitHub Enterprise 2.9.6
ami-e99eb88c	GitHub Enterprise 2.9.7
ami-28d8f94d	GitHub Enterprise 2.9.8
ami-ad1939c8	GitHub Enterprise 2.9.9
```
```
aws ec2 run-instances \
  --security-group-ids sg-xxxxxxx\
  --instance-type r3.xlarge \
  --image-id ami-fa18389f \
  --block-device-mappings '[{"DeviceName":"/dev/xvdf","Ebs":{"VolumeSize":100,"VolumeType":"gp2"}}]' \
  --key-name key_pair \
  --subnet-id subnet-xxxxxxx\
  --region us-east-2
```


```
$ ssh -p 122 admin@172.31.9.45
     ___ _ _   _  _      _      ___     _                    _
    / __(_) |_| || |_  _| |__  | __|_ _| |_ ___ _ _ _ __ _ _(_)___ ___
   | (_ | |  _| __ | || | '_ \ | _|| ' \  _/ -_) '_| '_ \ '_| (_-</ -_)
    \___|_|\__|_||_|\_,_|_.__/ |___|_||_\__\___|_| | .__/_| |_/__/\___|
                                                   |_|

Administrative shell access is permitted for troubleshooting and performing
documented operations procedures only. Modifying system and application files,
running programs, or installing unsupported software packages may void your
support contract. Please contact GitHub Enterprise technical support at
enterprise@github.com if you have a question about the activities allowed by
your support contract.
Last login: Fri Aug 18 15:11:45 2017 from 172.31.38.241
admin@ip-172-31-9-45:~$ sudo su -
root@ip-172-31-9-45:~# uname -a
Linux ip-172-31-9-45 3.16.0-4-amd64 #1 SMP Debian 3.16.43-2+deb8u2 (2017-06-26) x86_64 GNU/Linux

root@ip-172-31-9-45:~# lsof -i:80
COMMAND  PID    USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
haproxy 4021 haproxy    7u  IPv4  14888      0t0  TCP *:http (LISTEN)
haproxy 4021 haproxy    8u  IPv6  14889      0t0  TCP *:http (LISTEN)
root@ip-172-31-9-45:~# lsof -c haproxy
COMMAND  PID    USER   FD   TYPE             DEVICE SIZE/OFF    NODE NAME
haproxy 4021 haproxy  cwd    DIR              202,1     4096       2 /
haproxy 4021 haproxy  rtd    DIR              202,1     4096       2 /
haproxy 4021 haproxy  txt    REG              202,1  8409688 4462432 /usr/sbin/haproxy
haproxy 4021 haproxy  mem    REG              202,1    47712 5249011 /lib/x86_64-linux-gnu/libnss_files-2.19.so
haproxy 4021 haproxy  mem    REG              202,1    43592 5249013 /lib/x86_64-linux-gnu/libnss_nis-2.19.so
haproxy 4021 haproxy  mem    REG              202,1    89104 5249008 /lib/x86_64-linux-gnu/libnsl-2.19.so
haproxy 4021 haproxy  mem    REG              202,1    31632 5249009 /lib/x86_64-linux-gnu/libnss_compat-2.19.so
haproxy 4021 haproxy  mem    REG              202,1  1738176 5248969 /lib/x86_64-linux-gnu/libc-2.19.so
haproxy 4021 haproxy  mem    REG              202,1   137384 5249029 /lib/x86_64-linux-gnu/libpthread-2.19.so
haproxy 4021 haproxy  mem    REG              202,1    14664 5248979 /lib/x86_64-linux-gnu/libdl-2.19.so
haproxy 4021 haproxy  mem    REG              202,1   109144 5249048 /lib/x86_64-linux-gnu/libz.so.1.2.8
haproxy 4021 haproxy  mem    REG              202,1    35176 5248974 /lib/x86_64-linux-gnu/libcrypt-2.19.so
haproxy 4021 haproxy  mem    REG              202,1   140928 5248958 /lib/x86_64-linux-gnu/ld-2.19.so
haproxy 4021 haproxy    0u  0000                0,9        0    7726 anon_inode
haproxy 4021 haproxy    4u  unix 0xffff88078fc79b80      0t0   14884 /var/run/haproxy.sock.4019.tmp
haproxy 4021 haproxy    5u  IPv4              14886      0t0     TCP localhost:9201 (LISTEN)
haproxy 4021 haproxy    6u  IPv6              14887      0t0     TCP localhost:9201 (LISTEN)
haproxy 4021 haproxy    7u  IPv4              14888      0t0     TCP *:http (LISTEN)
haproxy 4021 haproxy    8u  IPv6              14889      0t0     TCP *:http (LISTEN)
haproxy 4021 haproxy    9u  IPv4              14890      0t0     TCP *:https (LISTEN)
haproxy 4021 haproxy   10u  IPv6              14891      0t0     TCP *:https (LISTEN)
haproxy 4021 haproxy   11u  IPv4              14892      0t0     TCP *:8443 (LISTEN)
haproxy 4021 haproxy   12u  IPv6              14893      0t0     TCP *:8443 (LISTEN)
root@ip-172-31-9-45:~# ps axu
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0  28796  5184 ?        Ss   14:58   0:01 /sbin/init splash
root         2  0.0  0.0      0     0 ?        S    14:58   0:00 [kthreadd]
root         3  0.3  0.0      0     0 ?        S    14:58   0:04 [ksoftirqd/0]
root         5  0.0  0.0      0     0 ?        S<   14:58   0:00 [kworker/0:0H]
root         6  0.0  0.0      0     0 ?        S    14:58   0:00 [kworker/u30:0]
root         7  0.1  0.0      0     0 ?        S    14:58   0:02 [rcu_sched]
root         8  0.0  0.0      0     0 ?        S    14:58   0:00 [rcu_bh]
root         9  0.0  0.0      0     0 ?        S    14:58   0:00 [migration/0]
root        10  0.0  0.0      0     0 ?        S    14:58   0:00 [watchdog/0]
root        11  0.0  0.0      0     0 ?        S    14:58   0:00 [watchdog/1]
root        12  0.0  0.0      0     0 ?        S    14:58   0:00 [migration/1]
root        13  0.1  0.0      0     0 ?        S    14:58   0:01 [ksoftirqd/1]
root        15  0.0  0.0      0     0 ?        S<   14:58   0:00 [kworker/1:0H]
root        16  0.0  0.0      0     0 ?        S    14:58   0:00 [watchdog/2]
root        17  0.0  0.0      0     0 ?        S    14:58   0:00 [migration/2]
root        18  0.3  0.0      0     0 ?        S    14:58   0:04 [ksoftirqd/2]
root        20  0.0  0.0      0     0 ?        S<   14:58   0:00 [kworker/2:0H]
root        21  0.0  0.0      0     0 ?        S    14:58   0:00 [watchdog/3]
root        22  0.0  0.0      0     0 ?        S    14:58   0:00 [migration/3]
root        23  0.2  0.0      0     0 ?        S    14:58   0:03 [ksoftirqd/3]
root        25  0.0  0.0      0     0 ?        S<   14:58   0:00 [kworker/3:0H]
root        26  0.0  0.0      0     0 ?        S<   14:58   0:00 [khelper]
root        27  0.0  0.0      0     0 ?        S    14:58   0:00 [kdevtmpfs]
root        28  0.0  0.0      0     0 ?        S<   14:58   0:00 [netns]
root        29  0.0  0.0      0     0 ?        S    14:58   0:00 [xenwatch]
root        30  0.0  0.0      0     0 ?        S    14:58   0:00 [xenbus]
root        31  0.0  0.0      0     0 ?        S    14:58   0:00 [kworker/0:1]
root        32  0.0  0.0      0     0 ?        S    14:58   0:00 [khungtaskd]
root        33  0.0  0.0      0     0 ?        S<   14:58   0:00 [writeback]
root        34  0.0  0.0      0     0 ?        SN   14:58   0:00 [ksmd]
root        35  0.0  0.0      0     0 ?        SN   14:58   0:00 [khugepaged]
root        36  0.0  0.0      0     0 ?        S<   14:58   0:00 [crypto]
root        37  0.0  0.0      0     0 ?        S<   14:58   0:00 [kintegrityd]
root        38  0.0  0.0      0     0 ?        S<   14:58   0:00 [bioset]
root        39  0.0  0.0      0     0 ?        S<   14:58   0:00 [kblockd]
root        40  0.0  0.0      0     0 ?        S    14:58   0:00 [kworker/1:1]
root        41  0.0  0.0      0     0 ?        S    14:58   0:00 [kworker/2:1]
root        43  0.0  0.0      0     0 ?        S    14:58   0:00 [kswapd0]
root        44  0.0  0.0      0     0 ?        S<   14:58   0:00 [vmstat]
root        45  0.0  0.0      0     0 ?        S    14:58   0:00 [fsnotify_mark]
root        51  0.0  0.0      0     0 ?        S<   14:58   0:00 [kthrotld]
root        52  0.0  0.0      0     0 ?        S<   14:58   0:00 [ipv6_addrconf]
root        53  0.0  0.0      0     0 ?        S<   14:58   0:00 [deferwq]
root        54  0.0  0.0      0     0 ?        S    14:58   0:00 [kworker/u30:1]
root        93  0.0  0.0      0     0 ?        S<   14:58   0:00 [kpsmoused]
root        96  0.0  0.0      0     0 ?        S<   14:58   0:00 [ata_sff]
root        97  0.0  0.0      0     0 ?        S    14:58   0:00 [scsi_eh_0]
root        98  0.0  0.0      0     0 ?        S<   14:58   0:00 [scsi_tmf_0]
root        99  0.0  0.0      0     0 ?        S    14:58   0:00 [scsi_eh_1]
root       100  0.0  0.0      0     0 ?        S<   14:58   0:00 [scsi_tmf_1]
root       103  0.0  0.0      0     0 ?        S<   14:58   0:00 [kworker/0:1H]
root       132  0.0  0.0      0     0 ?        S    14:58   0:00 [jbd2/xvda1-8]
root       133  0.0  0.0      0     0 ?        S<   14:58   0:00 [ext4-rsv-conver]
root       193  0.0  0.0      0     0 ?        S    14:58   0:00 [kauditd]
root       201  0.0  0.0      0     0 ?        S    14:58   0:00 [kworker/3:2]
root       213  0.0  0.0  41528  9644 ?        Ss   14:58   0:00 /lib/systemd/systemd-journald
root       222  0.0  0.0  41468  3952 ?        Ss   14:58   0:00 /lib/systemd/systemd-udevd
root       407  0.0  0.0  10040   116 ?        Ss   14:58   0:00 /sbin/rdnssd -u rdnssd -H /etc/rdnssd/merge-hook
rdnssd     408  0.0  0.0  18452  1644 ?        S    14:58   0:00 /sbin/rdnssd -u rdnssd -H /etc/rdnssd/merge-hook
root       617  0.0  0.0  15092  1740 ?        Ss   14:59   0:00 dhclient -v -pf /run/dhclient.eth0.pid -lf /var/lib/dhcp/dhclient.eth0.leases eth0
root       735  0.0  0.0 296396  7420 ?        Ss   14:59   0:00 /usr/sbin/syslog-ng -F --pidfile=/var/run/syslog-ng.pid
root       737  0.0  0.0  27504  2752 ?        Ss   14:59   0:00 /usr/sbin/cron -f
message+   742  0.0  0.0  42120  3272 ?        Ss   14:59   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root      1039  0.0  0.0  28352  2876 ?        Ss   14:59   0:00 /lib/systemd/systemd-logind
root      1086  0.8  0.0  10732  1712 ?        Ss   14:59   0:10 /usr/sbin/ipwatchd -c /etc/ipwatchd.conf
dnsmasq   1128  0.0  0.0  36744  2552 ?        S    14:59   0:00 /usr/sbin/dnsmasq -x /var/run/dnsmasq/dnsmasq.pid -u dnsmasq -I lo -7 /etc/dnsmasq.d,.dpkg-dist,.dpkg-old,.dpkg-new --local-se
root      1142  0.0  0.0  56756  1560 ?        Ss   14:59   0:00 nginx: master process /usr/sbin/nginx
git       1143  0.0  0.0  63424 10004 ?        S    14:59   0:00 nginx: worker process
root      1152  0.0  0.0 101356  2596 ?        S    14:59   0:00 /usr/sbin/chronyd
root      1191  0.1  0.0 465744  4064 ?        Ssl  14:59   0:02 /usr/bin/rrdcached -m 777 -l unix:/var/run/rrdcached.sock -F -b /var/lib/collectd/rrd/ -B -z 150 -w 300 -p /var/run/rrdcached.
root      3638  0.0  0.0   6276   900 ?        Ss   14:59   0:00 /usr/sbin/collectdmon -P /var/run/collectdmon.pid -- -C /etc/collectd/collectd.conf
root      3639  0.6  0.0 1106432 19644 ?       Sl   14:59   0:07 collectd -C /etc/collectd/collectd.conf -f
nobody    3674  0.0  0.0  48756 11540 ?        Sl   14:59   0:00 /usr/share/rbenv/versions/current/bin/ruby /usr/share/collectd/listener_stats.rb
root      3979  0.0  0.0  55184  5340 ?        Ss   14:59   0:00 /usr/sbin/sshd -D
root      3985  0.0  0.0  14236  2276 ttyS0    Ss+  14:59   0:00 /sbin/agetty --keep-baud 115200 38400 9600 ttyS0 vt102
haproxy   4021  0.0  0.0  33708  8144 ?        Ss   14:59   0:00 /usr/sbin/haproxy -D -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid
root      4113  0.0  0.0      0     0 ?        S<   14:59   0:00 [kdmflush]
root      4115  0.0  0.0      0     0 ?        S<   14:59   0:00 [bioset]
root      4124  0.0  0.0      0     0 ?        S    14:59   0:00 [jbd2/dm-0-8]
root      4125  0.0  0.0      0     0 ?        S<   14:59   0:00 [ext4-rsv-conver]
enterpr+  4612  0.0  0.1 144740 53992 ?        Ssl  14:59   0:01 unicorn master --env production --config-file config/unicorn.rb config.ru
enterpr+  4747  0.0  0.1 144740 48544 ?        Sl   14:59   0:00 unicorn worker[0] --env production --config-file config/unicorn.rb config.ru
enterpr+  4750  0.0  0.1 144740 48672 ?        Sl   14:59   0:00 unicorn worker[1] --env production --config-file config/unicorn.rb config.ru
root      4834  0.0  0.0      0     0 ?        S    15:12   0:00 [kworker/0:0]
root      4839  0.0  0.0      0     0 ?        S    15:12   0:00 [kworker/1:0]
root      4840  0.0  0.0      0     0 ?        S    15:12   0:00 [kworker/2:3]
root      4841  0.0  0.0  97532  6332 ?        Ss   15:12   0:00 sshd: admin [priv]
admin     4843  0.0  0.0  35636  3920 ?        Ss   15:12   0:00 /lib/systemd/systemd --user
admin     4844  0.0  0.0  54148  2172 ?        S    15:12   0:00 (sd-pam)
admin     4846  0.0  0.0  97532  3812 ?        R    15:12   0:00 sshd: admin@pts/0
admin     4848  0.0  0.0  21924  3824 pts/0    Ss   15:12   0:00 -bash
root      4858  0.0  0.0  55160  3788 pts/0    S    15:12   0:00 sudo su -
root      4859  0.0  0.0  58916  3420 pts/0    S    15:12   0:00 su -
root      4860  0.0  0.0  21932  3876 pts/0    S    15:12   0:00 -su
root      4875  0.0  0.0      0     0 ?        S    15:13   0:00 [kworker/3:0]
root      4897  0.0  0.0  19100  2592 pts/0    R+   15:19   0:00 ps axu
```
