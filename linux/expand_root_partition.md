
modified volume



amzlinux
--------------


```
sudo LANG=C growpart /dev/xvda 1
sudo resize2fs /dev/xvda1
```



centos7(xfs)
--------------------

```
sudo LANG=C growpart /dev/xvda 1
sudo xfs_growfs /dev/xvda1
```


example
--------------------------------

### centos 7


```
[centos@ip-172-31-1-56 ~]$ cat /etc/redhat-release
CentOS Linux release 7.2.1511 (Core)

[centos@ip-172-31-1-56 ~]$ uname -a
Linux ip-172-31-1-56 3.10.0-327.10.1.el7.x86_64 #1 SMP Tue Feb 16 17:03:50 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
```

before modify volume
```
[centos@ip-172-31-1-56 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /

[centos@ip-172-31-1-56 ~]$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/xvda1     xfs       8.0G  877M  7.2G  11% /
devtmpfs       devtmpfs  478M     0  478M   0% /dev
tmpfs          tmpfs     496M     0  496M   0% /dev/shm
tmpfs          tmpfs     496M   13M  484M   3% /run
tmpfs          tmpfs     496M     0  496M   0% /sys/fs/cgroup
tmpfs          tmpfs     100M     0  100M   0% /run/user/1000
```

inprogress (in-use - optimizing (n%))
```
[centos@ip-172-31-1-56 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
└─xvda1 202:1    0   8G  0 part /

[centos@ip-172-31-1-56 ~]$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/xvda1     xfs       8.0G  876M  7.2G  11% /
devtmpfs       devtmpfs  478M     0  478M   0% /dev
tmpfs          tmpfs     496M     0  496M   0% /dev/shm
tmpfs          tmpfs     496M   13M  484M   3% /run
tmpfs          tmpfs     496M     0  496M   0% /sys/fs/cgroup
tmpfs          tmpfs     100M     0  100M   0% /run/user/1000
```



### amzlinux


```
[ec2-user@ip-172-31-10-188 ~]$ cat /etc/system-release
Amazon Linux AMI release 2017.03

[ec2-user@ip-172-31-10-188 ~]$ uname -a
Linux ip-172-31-10-188 4.9.17-8.31.amzn1.x86_64 #1 SMP Sat Apr 1 01:22:16 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
```
before modify volume
```
[ec2-user@ip-172-31-10-188 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /

[ec2-user@ip-172-31-10-188 ~]$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  488M   56K  488M   1% /dev
tmpfs          tmpfs     497M     0  497M   0% /dev/shm
/dev/xvda1     ext4      7.8G  970M  6.8G  13% /
```

inprogress (in-use - optimizing (n%))
```
[ec2-user@ip-172-31-10-188 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
└─xvda1 202:1    0   8G  0 part /

[ec2-user@ip-172-31-10-188 ~]$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  488M   56K  488M   1% /dev
tmpfs          tmpfs     497M     0  497M   0% /dev/shm
/dev/xvda1     ext4      7.8G  970M  6.8G  13% /
```

execute growpart and resize2fs
```
[ec2-user@ip-172-31-10-188 ~]$ sudo growpart /dev/xvda 1
CHANGED: disk=/dev/xvda partition=1: start=4096 old: size=16773086,end=16777182 new: size=20967390,end=20971486

[ec2-user@ip-172-31-10-188 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
└─xvda1 202:1    0  10G  0 part /

[ec2-user@ip-172-31-10-188 ~]$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  488M   56K  488M   1% /dev
tmpfs          tmpfs     497M     0  497M   0% /dev/shm
/dev/xvda1     ext4      7.8G  970M  6.8G  13% /
```


```
[ec2-user@ip-172-31-10-188 ~]$ sudo resize2fs /dev/xvda1
resize2fs 1.42.12 (29-Aug-2014)
Filesystem at /dev/xvda1 is mounted on /; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 1
The filesystem on /dev/xvda1 is now 2620923 (4k) blocks long.

[ec2-user@ip-172-31-10-188 ~]$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  488M   56K  488M   1% /dev
tmpfs          tmpfs     497M     0  497M   0% /dev/shm
/dev/xvda1     ext4      9.8G  970M  8.7G  10% /

[ec2-user@ip-172-31-10-188 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
└─xvda1 202:1    0  10G  0 part /
```

check

```
[ec2-user@ip-172-31-10-188 ~]$ for i in {0..7}
> do
> dd if=/dev/zero of=tempfile-${i} bs=100M count=10
> done
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 13.0664 s, 80.2 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 15.773 s, 66.5 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 15.3285 s, 68.4 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 15.7831 s, 66.4 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 15.6766 s, 66.9 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 15.5918 s, 67.3 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 15.8019 s, 66.4 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 15.5962 s, 67.2 MB/s

[ec2-user@ip-172-31-10-188 ~]$ ll
total 8192032
-rw-rw-r-- 1 ec2-user ec2-user 1048576000 Apr  5 02:19 tempfile-0
-rw-rw-r-- 1 ec2-user ec2-user 1048576000 Apr  5 02:19 tempfile-1
-rw-rw-r-- 1 ec2-user ec2-user 1048576000 Apr  5 02:19 tempfile-2
-rw-rw-r-- 1 ec2-user ec2-user 1048576000 Apr  5 02:20 tempfile-3
-rw-rw-r-- 1 ec2-user ec2-user 1048576000 Apr  5 02:20 tempfile-4
-rw-rw-r-- 1 ec2-user ec2-user 1048576000 Apr  5 02:20 tempfile-5
-rw-rw-r-- 1 ec2-user ec2-user 1048576000 Apr  5 02:21 tempfile-6
-rw-rw-r-- 1 ec2-user ec2-user 1048576000 Apr  5 02:21 tempfile-7

[ec2-user@ip-172-31-10-188 ~]$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  488M   56K  488M   1% /dev
tmpfs          tmpfs     497M     0  497M   0% /dev/shm
/dev/xvda1     ext4      9.8G  8.8G  882M  92% /
```



### ubuntu

```
ubuntu@ip-172-31-6-187:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.1 LTS
Release:        16.04
Codename:       xenial

ubuntu@ip-172-31-6-187:~$ uname -a
Linux ip-172-31-6-187 4.4.0-57-generic #78-Ubuntu SMP Fri Dec 9 23:50:32 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
```
before
```
ubuntu@ip-172-31-6-187:~$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /

ubuntu@ip-172-31-6-187:~$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  489M     0  489M   0% /dev
tmpfs          tmpfs     100M  4.3M   95M   5% /run
/dev/xvda1     ext4      7.8G  926M  6.5G  13% /
tmpfs          tmpfs     496M     0  496M   0% /dev/shm
tmpfs          tmpfs     5.0M     0  5.0M   0% /run/lock
tmpfs          tmpfs     496M     0  496M   0% /sys/fs/cgroup
tmpfs          tmpfs     100M     0  100M   0% /run/user/1000
```

inprogress
```
ubuntu@ip-172-31-6-187:~$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
└─xvda1 202:1    0   8G  0 part /

ubuntu@ip-172-31-6-187:~$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  489M     0  489M   0% /dev
tmpfs          tmpfs     100M  4.3M   95M   5% /run
/dev/xvda1     ext4      7.8G  925M  6.5G  13% /
tmpfs          tmpfs     496M     0  496M   0% /dev/shm
tmpfs          tmpfs     5.0M     0  5.0M   0% /run/lock
tmpfs          tmpfs     496M     0  496M   0% /sys/fs/cgroup
tmpfs          tmpfs     100M     0  100M   0% /run/user/1000
```
