
#default is UTC
```bash
date
Tue Mar 10 02:15:55 UTC 2015
```

#change JST
```bash
cp /etc/localtime /etc/localtime.org
\cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
```

#new

```bash
rpm -qf /etc/localtime
glibc-2.17-55.143.amzn1.x86_64
````

`yum provides "*/localtime"`

```
glibc-2.17-78.161.amzn1.i686 : The GNU libc libraries
Repo        : amzn-main
Matched from:
Filename    : /etc/localtime



glibc-2.17-78.161.amzn1.x86_64 : The GNU libc libraries
Repo        : amzn-main
Matched from:
Filename    : /etc/localtime



glibc-2.17-55.143.amzn1.x86_64 : The GNU libc libraries
Repo        : @amzn-updates
Matched from:
Filename    : /etc/localtime
```



```bash
cp /etc/sysconfig/clock /etc/sysconfig/config.org
cat /etc/sysconfig/clock

ZONE="UTC"
UTC=true


sed  -i 's/^ZONE\(.*\)/#ZONE\1\nZONE="Asia\/Tokyo"/' /etc/sysconfig/clock

cat /etc/sysconfig/clock

#ZONE="UTC"
ZONE="Asia/Tokyo"
UTC=true


reboot
```
