# Extending a Linux File System After Resizing a Volume

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recognize-expanded-volume-linux.html


amazonlinux2 (XFS)

```console
$ lsblk                             
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
nvme0n1       259:0    0  200G  0 disk
├─nvme0n1p1   259:1    0    8G  0 part /
└─nvme0n1p128 259:2    0    1M  0 part
```

```console
$ df -hT                            
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  2.5G     0  2.5G   0% /dev
tmpfs          tmpfs     2.5G     0  2.5G   0% /dev/shm
tmpfs          tmpfs     2.5G  620K  2.5G   1% /run
tmpfs          tmpfs     2.5G     0  2.5G   0% /sys/fs/cgroup
/dev/nvme0n1p1 xfs       8.0G  7.6G  493M  94% /
tmpfs          tmpfs     497M     0  497M   0% /run/user/1000
```

```console
$ sudo file -s /dev/nvme?n*
/dev/nvme0n1:     x86 boot sector; partition 1: ID=0xee, starthead 0, startsector 1, 16777215 sectors, extended partition table (last)\011, code offset 0x63
/dev/nvme0n1p1:   SGI XFS filesystem data (blksz 4096, inosz 512, v2 dirs)
/dev/nvme0n1p128: data
```

```console
$ sudo growpart /dev/nvme0n1 1
CHANGED: partition=1 start=4096 old: size=16773087 end=16777183 new: size=419426271,end=419430367
```
```console
$ lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
nvme0n1       259:0    0  200G  0 disk
├─nvme0n1p1   259:1    0  200G  0 part /
└─nvme0n1p128 259:2    0    1M  0 part
```

```console
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        2.5G     0  2.5G   0% /dev
tmpfs           2.5G     0  2.5G   0% /dev/shm
tmpfs           2.5G  620K  2.5G   1% /run
tmpfs           2.5G     0  2.5G   0% /sys/fs/cgroup
/dev/nvme0n1p1  8.0G  7.6G  493M  94% /
tmpfs           497M     0  497M   0% /run/user/1000
```

```console
$ sudo xfs_growfs -d /
meta-data=/dev/nvme0n1p1         isize=512    agcount=4, agsize=524159 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1 spinodes=0
data     =                       bsize=4096   blocks=2096635, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal               bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data blocks changed from 2096635 to 52428283
```
```console
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        2.5G     0  2.5G   0% /dev
tmpfs           2.5G     0  2.5G   0% /dev/shm
tmpfs           2.5G  620K  2.5G   1% /run
tmpfs           2.5G     0  2.5G   0% /sys/fs/cgroup
/dev/nvme0n1p1  200G  7.8G  193G   4% /
tmpfs           497M     0  497M   0% /run/user/1000
```
