```
[root@ip-172-31-45-123 ~]# df -T
Filesystem     Type     1K-blocks    Used Available Use% Mounted on
devtmpfs       devtmpfs   1011172       0   1011172   0% /dev
tmpfs          tmpfs      1024456       0   1024456   0% /dev/shm
tmpfs          tmpfs      1024456   16648   1007808   2% /run
tmpfs          tmpfs      1024456       0   1024456   0% /sys/fs/cgroup
/dev/xvda1     xfs        8376300 1295200   7081100  16% /
tmpfs          tmpfs       204892       0    204892   0% /run/user/1000
```

```
[root@ip-172-31-45-123 ~]# cd /var/run/
[root@ip-172-31-45-123 run]# pwd -L
/var/run
[root@ip-172-31-45-123 run]# pwd -P
/run
```
