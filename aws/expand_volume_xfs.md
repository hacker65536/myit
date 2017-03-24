ルートボリュームを増やした場合


```
[centos@ip-172-31-6-149 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  20G  0 disk
└─xvda1 202:1    0   8G  0 part /
```

```
[centos@ip-172-31-6-149 ~]$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvda1      8.0G  1.1G  7.0G  14% /
devtmpfs        478M     0  478M   0% /dev
tmpfs           496M     0  496M   0% /dev/shm
tmpfs           496M   13M  484M   3% /run
tmpfs           496M     0  496M   0% /sys/fs/cgroup
tmpfs           100M     0  100M   0% /run/user/1000
tmpfs           100M     0  100M   0% /run/user/0

```
サイズは20Gだけどシステムとしては8Gのパーティションで切っている

resize2fsではできない。以前もルートボリュームの追加はちょっと面倒くさかった
```
[centos@ip-172-31-6-149 ~]$ sudo resize2fs /dev/xvda1
resize2fs 1.42.9 (28-Dec-2013)
resize2fs: Bad magic number in super-block while trying to open /dev/xvda1
Couldn't find valid filesystem superblock.
```


```
[centos@ip-172-31-6-149 ~]$ sudo yum install xfsprogs
```

```
[centos@ip-172-31-6-149 ~]$ sudo xfs_growfs -d /dev/xvda1
meta-data=/dev/xvda1             isize=256    agcount=4, agsize=524224 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=0        finobt=0 spinodes=0
data     =                       bsize=4096   blocks=2096896, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=0
log      =internal               bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data size unchanged, skipping
```

再起動後
```
[centos@ip-172-31-6-149 ~]$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvda1       20G  1.1G   19G   6% /
devtmpfs        478M     0  478M   0% /dev
tmpfs           496M     0  496M   0% /dev/shm
tmpfs           496M   13M  484M   3% /run
tmpfs           496M     0  496M   0% /sys/fs/cgroup
tmpfs           100M     0  100M   0% /run/user/1000
```
