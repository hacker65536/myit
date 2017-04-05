
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

resize
```
[centos@ip-172-31-1-56 ~]$ sudo growpart /dev/xvda 1
CHANGED: partition=1 start=2048 old: size=16775168 end=16777216 new: size=20962777,end=20964825

[centos@ip-172-31-1-56 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
└─xvda1 202:1    0  10G  0 part /
[centos@ip-172-31-1-56 ~]$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/xvda1     xfs       8.0G  877M  7.2G  11% /
devtmpfs       devtmpfs  478M     0  478M   0% /dev
tmpfs          tmpfs     496M     0  496M   0% /dev/shm
tmpfs          tmpfs     496M   13M  484M   3% /run
tmpfs          tmpfs     496M     0  496M   0% /sys/fs/cgroup
tmpfs          tmpfs     100M     0  100M   0% /run/user/1000
tmpfs          tmpfs     100M     0  100M   0% /run/user/0
```

```
[centos@ip-172-31-1-56 ~]$ sudo xfs_growfs /dev/xvda1
meta-data=/dev/xvda1             isize=256    agcount=4, agsize=524224 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=0        finobt=0
data     =                       bsize=4096   blocks=2096896, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=0
log      =internal               bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data blocks changed from 2096896 to 2620347

[centos@ip-172-31-1-56 ~]$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/xvda1     xfs        10G  877M  9.2G   9% /
devtmpfs       devtmpfs  478M     0  478M   0% /dev
tmpfs          tmpfs     496M     0  496M   0% /dev/shm
tmpfs          tmpfs     496M   13M  484M   3% /run
tmpfs          tmpfs     496M     0  496M   0% /sys/fs/cgroup
tmpfs          tmpfs     100M     0  100M   0% /run/user/1000
tmpfs          tmpfs     100M     0  100M   0% /run/user/0
```

check
```
[centos@ip-172-31-1-56 ~]$ for i in $(seq 8); do dd if=/dev/zero of=tempfile-${i} bs=100M count=10; done
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 12.6525 s, 82.9 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 16.5507 s, 63.4 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 16.3925 s, 64.0 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 16.413 s, 63.9 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 16.3888 s, 64.0 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 16.3792 s, 64.0 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 16.3631 s, 64.1 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB) copied, 16.332 s, 64.2 MB/s

[centos@ip-172-31-1-56 ~]$ ll
total 8192000
-rw-rw-r--. 1 centos centos 1048576000 Apr  5 02:31 tempfile-1
-rw-rw-r--. 1 centos centos 1048576000 Apr  5 02:31 tempfile-2
-rw-rw-r--. 1 centos centos 1048576000 Apr  5 02:32 tempfile-3
-rw-rw-r--. 1 centos centos 1048576000 Apr  5 02:32 tempfile-4
-rw-rw-r--. 1 centos centos 1048576000 Apr  5 02:32 tempfile-5
-rw-rw-r--. 1 centos centos 1048576000 Apr  5 02:32 tempfile-6
-rw-rw-r--. 1 centos centos 1048576000 Apr  5 02:33 tempfile-7
-rw-rw-r--. 1 centos centos 1048576000 Apr  5 02:33 tempfile-8

[centos@ip-172-31-1-56 ~]$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/xvda1     xfs        10G  8.7G  1.4G  87% /
devtmpfs       devtmpfs  478M     0  478M   0% /dev
tmpfs          tmpfs     496M     0  496M   0% /dev/shm
tmpfs          tmpfs     496M   13M  484M   3% /run
tmpfs          tmpfs     496M     0  496M   0% /sys/fs/cgroup
tmpfs          tmpfs     100M     0  100M   0% /run/user/1000
tmpfs          tmpfs     100M     0  100M   0% /run/user/0
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
resize
```
ubuntu@ip-172-31-6-187:~$ sudo growpart /dev/xvda 1
CHANGED: partition=1 start=16065 old: size=16761118 end=16777183 new: size=20955422,end=20971487

ubuntu@ip-172-31-6-187:~$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
└─xvda1 202:1    0  10G  0 part /

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
```
ubuntu@ip-172-31-6-187:~$ sudo resize2fs /dev/xvda1
resize2fs 1.42.13 (17-May-2015)
Filesystem at /dev/xvda1 is mounted on /; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 1
The filesystem on /dev/xvda1 is now 2619427 (4k) blocks long.

ubuntu@ip-172-31-6-187:~$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  489M     0  489M   0% /dev
tmpfs          tmpfs     100M  4.3M   95M   5% /run
/dev/xvda1     ext4      9.8G  925M  8.4G  10% /
tmpfs          tmpfs     496M     0  496M   0% /dev/shm
tmpfs          tmpfs     5.0M     0  5.0M   0% /run/lock
tmpfs          tmpfs     496M     0  496M   0% /sys/fs/cgroup
tmpfs          tmpfs     100M     0  100M   0% /run/user/1000
```


check

```
ubuntu@ip-172-31-6-187:~$  for i in $(seq 8); do dd if=/dev/zero of=tempfile-${i} bs=100M count=10; done
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 12.9034 s, 81.3 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 16.5207 s, 63.5 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 16.311 s, 64.3 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 16.3967 s, 64.0 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 16.3752 s, 64.0 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 16.3845 s, 64.0 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 16.3409 s, 64.2 MB/s
10+0 records in
10+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 16.3972 s, 63.9 MB/s

ubuntu@ip-172-31-6-187:~$ ls -l
total 8192032
-rw-rw-r-- 1 ubuntu ubuntu 1048576000 Apr  5 02:48 tempfile-1
-rw-rw-r-- 1 ubuntu ubuntu 1048576000 Apr  5 02:48 tempfile-2
-rw-rw-r-- 1 ubuntu ubuntu 1048576000 Apr  5 02:48 tempfile-3
-rw-rw-r-- 1 ubuntu ubuntu 1048576000 Apr  5 02:48 tempfile-4
-rw-rw-r-- 1 ubuntu ubuntu 1048576000 Apr  5 02:49 tempfile-5
-rw-rw-r-- 1 ubuntu ubuntu 1048576000 Apr  5 02:49 tempfile-6
-rw-rw-r-- 1 ubuntu ubuntu 1048576000 Apr  5 02:49 tempfile-7
-rw-rw-r-- 1 ubuntu ubuntu 1048576000 Apr  5 02:50 tempfile-8

ubuntu@ip-172-31-6-187:~$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  489M     0  489M   0% /dev
tmpfs          tmpfs     100M  4.3M   95M   5% /run
/dev/xvda1     ext4      9.8G  8.8G  512M  95% /
tmpfs          tmpfs     496M     0  496M   0% /dev/shm
tmpfs          tmpfs     5.0M     0  5.0M   0% /run/lock
tmpfs          tmpfs     496M     0  496M   0% /sys/fs/cgroup
tmpfs          tmpfs     100M     0  100M   0% /run/user/1000

```

### centos6

env
```
[centos@ip-172-31-7-102 ~]$ cat /etc/redhat-release
CentOS release 6.7 (Final)

[centos@ip-172-31-7-102 ~]$ uname -a
Linux ip-172-31-7-102 2.6.32-573.18.1.el6.x86_64 #1 SMP Tue Feb 9 22:46:17 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
```

require
```
[centos@ip-172-31-7-102 ~]$ sudo yum install -y epel-release

[centos@ip-172-31-7-102 ~]$ sudo yum install --enablerepo=epel cloud-utils-growpart

```



before
```
[centos@ip-172-31-7-102 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /

[centos@ip-172-31-7-102 ~]$ df -hT
Filesystem     Type   Size  Used Avail Use% Mounted on
/dev/xvda1     ext4   7.8G  741M  6.7G  10% /
tmpfs          tmpfs  498M     0  498M   0% /dev/shm
```
inprogress

```
[centos@ip-172-31-7-102 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
└─xvda1 202:1    0   8G  0 part /

[centos@ip-172-31-7-102 ~]$ df -hT
Filesystem     Type   Size  Used Avail Use% Mounted on
/dev/xvda1     ext4   7.8G  741M  6.7G  10% /
tmpfs          tmpfs  498M     0  498M   0% /dev/shm
```

resize
```
[centos@ip-172-31-7-102 ~]$ sudo growpart  /dev/xvda 1
CHANGED: partition=1 start=2048 old: size=16775168 end=16777216 new: size=20962777,end=20964825

[centos@ip-172-31-7-102 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
└─xvda1 202:1    0   8G  0 part /

[centos@ip-172-31-7-102 ~]$ df -hT
Filesystem     Type   Size  Used Avail Use% Mounted on
/dev/xvda1     ext4   7.8G  741M  6.7G  10% /
tmpfs          tmpfs  498M     0  498M   0% /dev/shm
```
```
[centos@ip-172-31-7-102 ~]$ sudo resize2fs /dev/xvda1
resize2fs 1.41.12 (17-May-2010)
The filesystem is already 2096896 blocks long.  Nothing to do!

[centos@ip-172-31-7-102 ~]$ df -hT
Filesystem     Type   Size  Used Avail Use% Mounted on
/dev/xvda1     ext4   7.8G  741M  6.7G  10% /
tmpfs          tmpfs  498M     0  498M   0% /dev/shm

```
