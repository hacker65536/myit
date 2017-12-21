https://aws.amazon.com/jp/blogs/news/keeping-time-with-amazon-time-sync-service/

cent7
------
```
[centos@ip-172-31-42-83 ~]$ cat /etc/centos-release
CentOS Linux release 7.4.1708 (Core)
[centos@ip-172-31-42-83 ~]$ chronyc tracking
Reference ID    : 00000000 ()
Stratum         : 0
Ref time (UTC)  : Thu Jan 01 00:00:00 1970
System time     : 0.000000000 seconds fast of NTP time
Last offset     : +0.000000000 seconds
RMS offset      : 0.000000000 seconds
Frequency       : 0.000 ppm slow
Residual freq   : +0.000 ppm
Skew            : 0.000 ppm
Root delay      : 1.000000000 seconds
Root dispersion : 1.000000000 seconds
Update interval : 0.0 seconds
Leap status     : Not synchronised
[centos@ip-172-31-42-83 ~]$ chronyc tracking
Reference ID    : C7E9ECE2 (pyramid.latt.net)
Stratum         : 3
Ref time (UTC)  : Thu Dec 21 06:55:09 2017
System time     : 0.000031625 seconds slow of NTP time
Last offset     : -0.000032352 seconds
RMS offset      : 0.000032352 seconds
Frequency       : 27.438 ppm slow
Residual freq   : +14.648 ppm
Skew            : 0.162 ppm
Root delay      : 0.088264696 seconds
Root dispersion : 0.019378712 seconds
Update interval : 2.1 seconds
Leap status     : Normal
```
```
[centos@ip-172-31-42-83 ~]$ diff \
<(sed -e "s/\(^server*\)/#\1/" -e "7cserver 169.254.169.123 prefer iburst" /etc/chrony.conf ) \
<(cat /etc/chrony.conf)
3,7c3,7
< #server 0.centos.pool.ntp.org iburst
< #server 1.centos.pool.ntp.org iburst
< #server 2.centos.pool.ntp.org iburst
< #server 3.centos.pool.ntp.org iburst
< server 169.254.169.123 prefer iburst
---
> server 0.centos.pool.ntp.org iburst
> server 1.centos.pool.ntp.org iburst
> server 2.centos.pool.ntp.org iburst
> server 3.centos.pool.ntp.org iburst
>
```

```
[centos@ip-172-31-42-83 ~]$ sudo systemctl restart chronyd
[centos@ip-172-31-42-83 ~]$ chronyc tracking
Reference ID    : A9FEA97B (169.254.169.123)
Stratum         : 4
Ref time (UTC)  : Thu Dec 21 07:01:28 2017
System time     : 0.000000031 seconds fast of NTP time
Last offset     : -0.000031147 seconds
RMS offset      : 0.000031147 seconds
Frequency       : 27.020 ppm slow
Residual freq   : -8.655 ppm
Skew            : 0.672 ppm
Root delay      : 0.000404325 seconds
Root dispersion : 0.000760876 seconds
Update interval : 2.0 seconds
Leap status     : Normal
```

amz2
------------
```
[root@ip-172-31-15-15 ~]# cat /etc/system-release
Amazon Linux release 2.0 (2017.12) LTS Release Candidate
[root@ip-172-31-15-15 ~]# chronyc tracking
Reference ID    : A9FEA97B (169.254.169.123)
Stratum         : 4
Ref time (UTC)  : Thu Dec 21 06:48:02 2017
System time     : 0.000010684 seconds slow of NTP time
Last offset     : -0.000019677 seconds
RMS offset      : 0.000021056 seconds
Frequency       : 17.816 ppm fast
Residual freq   : -0.001 ppm
Skew            : 0.014 ppm
Root delay      : 0.000631374 seconds
Root dispersion : 0.000586493 seconds
Update interval : 1033.6 seconds
Leap status     : Normal
```
