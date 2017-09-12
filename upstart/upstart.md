

```
$ rpm -qa|grep upstart
upstart-0.6.5-13.3.13.amzn1.x86_64
```


```
$ initctl --version
initctl (upstart 0.6.5)
Copyright (C) 2010 Canonical Ltd.
```


```
$ ls -l /etc/init/
total 72
-rw-r--r-- 1 root root  412 Apr  9  2015 control-alt-delete.conf
-rw-r--r-- 1 root root  330 Jun 20 18:01 elastic-network-interfaces.conf
-rw-r--r-- 1 root root  130 Mar 21  2014 init-system-dbus.conf
-rw-r--r-- 1 root root  463 Apr  9  2015 kexec-disable.conf
-rw-r--r-- 1 root root 1120 Sep 12 09:37 logstash.conf
-rw-r--r-- 1 root root  560 Apr  9  2015 plymouth-shutdown.conf
-rw-r--r-- 1 root root  357 Apr  9  2015 prefdm.conf
-rw-r--r-- 1 root root   60 Aug 13 02:16 print-image-id.conf
-rw-r--r-- 1 root root  505 Apr  9  2015 quit-plymouth.conf
-rw-r--r-- 1 root root  417 Apr  9  2015 rc.conf
-rw-r--r-- 1 root root 1046 Apr  9  2015 rcS.conf
-rw-r--r-- 1 root root  430 Apr  9  2015 rcS-emergency.conf
-rw-r--r-- 1 root root  725 Apr  9  2015 rcS-sulogin.conf
-rw-r--r-- 1 root root 1297 Oct 12  2016 serial.conf
-rw-r--r-- 1 root root  791 Apr  9  2015 splash-manager.conf
-rw-r--r-- 1 root root  473 Apr  9  2015 start-ttys.conf
-rw-r--r-- 1 root root  335 Apr  9  2015 tty.conf
-rw-r--r-- 1 root root   63 Oct 31  2014 update-motd.conf

```

```
$ initctl list |sort
control-alt-delete stop/waiting
elastic-network-interfaces stop/waiting
init-system-dbus stop/waiting
kexec-disable stop/waiting
logstash stop/waiting
plymouth-shutdown stop/waiting
prefdm stop/waiting
print-image-id stop/waiting
quit-plymouth stop/waiting
rcS-emergency stop/waiting
rcS stop/waiting
rcS-sulogin stop/waiting
rc stop/waiting
serial (ttyS0) start/running, process 2752
splash-manager stop/waiting
start-ttys stop/waiting
tty (/dev/tty1) start/running, process 2751
tty (/dev/tty2) start/running, process 2756
tty (/dev/tty3) start/running, process 2759
tty (/dev/tty4) start/running, process 2761
tty (/dev/tty5) start/running, process 2763
tty (/dev/tty6) start/running, process 2765
update-motd stop/waiting

```


```
sudo tee /etc/init/testjob.conf > /dev/null <<'EOF'
description "A test job file for experimenting with Upstart"
author "Your Name"
start on runlevel [2345]
exec echo Test Job ran at  `date` >> /var/log/testjob.log
EOF
```

```
init-checkconf /etc/init/testjob.conf
```
