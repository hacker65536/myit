
default is UTC
```bash
date
Tue Mar 10 02:15:55 UTC 2015
```

change JST
```bash
cp /etc/localtime /etc/localtime.org
\cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
```

new
```bash
cp /etc/sysconfig/clock /etc/sysconfig/config.org
cat /etc/sysconfig/clock

ZONE="UTC"
UTC=true


sed -i 's/ZONE\(.*\)/#ZONE\1\nZONE="Asia\/Tokyo"/' /etc/sysconfig/clock

cat /etc/sysconfig/clock

#ZONE="UTC"
ZONE="Asia/Tokyo"
UTC=true


reboot
```
