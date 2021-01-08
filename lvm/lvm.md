## CentOS 6.x configure lvm

1. create EBS volume
2. attach ebs volume to instance
3. create paritition
4. create physical volume
5. create volume group
6. create logical volume
7. mount
8. mount at boot


### search ami of centos 6.x
```console
$ aws ec2 describe-images --filters \
Name=product-code,Values=6x5jmcajty9edm3f211pqjfn2 \
Name=is-public,Values=true | \
Name=virtualization-type,Values=hvm \
jq -r '.Images | sort_by(.CreationDate) | reverse | .[0].ImageId'
ami-0db8e77c005d79e33
```
### launch ec2 instance


```console
$ id=i-08b28662df23e2c4f; aws ec2 describe-instances --instance-ids $id --query 'Reservations[*].Instances[*].SubnetId' --output text| xargs -I{}  aws ec2 describe-subnets --subnet-ids {} --query 'Subnets[*].AvailabilityZone' --output text
us-east-2a
```

### create ebs volume

```console
$ for i in $(seq 1 3);do aws ec2 create-volume --availability-zone us-east-2a --volume-type gp2 --size 8 --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=lvm}]' | jq -r '.VolumeId';done
vol-09c34aa6aaf116a1e
vol-004b20e6bb460d21d
vol-0ff8b58780a0727a1
```


`vol-09c34aa6aaf116a1e` `vol-004b20e6bb460d21d` `vol-0ff8b58780a0727a1` の３つを作成した。

### attach ebs volume


https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/volume_limits.html

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html#available-ec2-device-names

| Virtualization type | Available                                                       | Reserved for root                     | Recommended for EBS volumes    | Instance store volumes                                                                         |
|---------------------|-----------------------------------------------------------------|---------------------------------------|--------------------------------|------------------------------------------------------------------------------------------------|
| Paravirtual         | /dev/sd[a-z] /dev/sd[a-z][1-15] /dev/hd[a-z] /dev/hd[a-z][1-15] | /dev/sda1                             | /dev/sd[f-p] /dev/sd[f-p][1-6] | /dev/sd[b-e]                                                                                   |
| HVM                 | /dev/sd[a-z] /dev/xvd[b-c][a-z]                                 | Differs by AMI /dev/sda1 or /dev/xvda | /dev/sd[f-p] *                 | /dev/sd[b-e] /dev/sd[b-h] (h1.16xlarge) /dev/sd[b-y] (d2.8xlarge) /dev/sd[b-i] (i2.8xlarge) ** |


```shell:attachvolume.sh
#!/bin/bash

id=i-08b28662df23e2c4f
volume=(vol-09c34aa6aaf116a1e vol-004b20e6bb460d21d vol-0ff8b58780a0727a1)
read -a devicesuf <<<$(echo {f..h})
n=0

for v in ${volume[@]}
do
  aws ec2 attach-volume --device "/dev/sd${devicesuf[$n]}" --instance-id $id --volume-id $v
  n=$((n+1))
done
```
```console
$ sh attachvolume.sh
{
    "AttachTime": "2021-01-07T11:05:06.733Z",
    "Device": "/dev/sdf",
    "InstanceId": "i-08b28662df23e2c4f",
    "State": "attaching",
    "VolumeId": "vol-09c34aa6aaf116a1e"
}
{
    "AttachTime": "2021-01-07T11:05:07.484Z",
    "Device": "/dev/sdg",
    "InstanceId": "i-08b28662df23e2c4f",
    "State": "attaching",
    "VolumeId": "vol-004b20e6bb460d21d"
}
{
    "AttachTime": "2021-01-07T11:05:08.236Z",
    "Device": "/dev/sdh",
    "InstanceId": "i-08b28662df23e2c4f",
    "State": "attaching",
    "VolumeId": "vol-0ff8b58780a0727a1"
}
```

```console
$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
xvdf    202:80   0   8G  0 disk
xvdg    202:96   0   8G  0 disk
xvdh    202:112  0   8G  0 disk
```
### configure lvm

https://wiki.centos.org/About/Product

CentOS6 EOL `November 30th, 2020` 

#### configure yum repo
```console
$ sudo cp /etc/yum.repos.d/CentOS-Base.repo{,.bak}
```
```console
$ sudo sed -i \
-e "s/^mirrorlist=http:\/\/mirrorlist.centos.org/#mirrorlist=http:\/\/mirrorlist.centos.org/g" \
-e "s/^#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" \
/etc/yum.repos.d/CentOS-Base.repo
```

#### install lvm2 parted
```console
$ sudo yum install -y lvm2 parted
```

#### create partition
```console
$ sudo parted /dev/xvdf
GNU Parted 2.1
Using /dev/xvdf
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) mklabel msdos
(parted) mkpart primary
File system type?  [ext2]? ext4
Start? 1
End? -1
(parted) set 1 lvm on
(parted) p
Model: Xen Virtual Block Device (xvd)
Disk /dev/xvdf: 8590MB
Sector size (logical/physical): 512B/512B
Partition Table: msdos

Number  Start   End     Size    Type     File system  Flags
 1      1049kB  8589MB  8588MB  primary               lvm
(parted) quit
Information: You may need to update /etc/fstab.
```

```console
$ for v in {f..h}; do sudo parted -s -a optimal /dev/xvd${v} -- mklabel msdos mkpart primary ext4 1 -1 set 1 lvm on ; done
```
```console
$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
xvdf    202:80   0   8G  0 disk
└─xvdf1 202:81   0   8G  0 part
xvdg    202:96   0   8G  0 disk
└─xvdg1 202:97   0   8G  0 part
xvdh    202:112  0   8G  0 disk
└─xvdh1 202:113  0   8G  0 part
```

#### create physical volume

```console
$ sudo pvcreate /dev/xvdf1 /dev/xvdg1 /dev/xvdh1
  Physical volume "/dev/xvdf1" successfully created
  Physical volume "/dev/xvdg1" successfully created
  Physical volume "/dev/xvdh1" successfully created
```
```console
$ sudo pvdisplay
  "/dev/xvdf1" is a new physical volume of "8.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/xvdf1
  VG Name
  PV Size               8.00 GiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               c027jU-HJnr-juMY-KqQI-7Xl7-xQOA-7vEA0P

  "/dev/xvdg1" is a new physical volume of "8.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/xvdg1
  VG Name
  PV Size               8.00 GiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               viFf3l-8Ssr-wJij-Phc2-dTtm-IqkL-Btt3am

  "/dev/xvdh1" is a new physical volume of "8.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/xvdh1
  VG Name
  PV Size               8.00 GiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               t3i9He-ShC9-40yg-F8J
```

#### create volume group

```console
$ sudo vgcreate lvg-extvol /dev/xv{df1,dg1,dh1}
  Volume group "lvg-extvol" successfully created
```
```console
$ sudo vgdisplay
  --- Volume group ---
  VG Name               lvg-extvol
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               23.99 GiB
  PE Size               4.00 MiB
  Total PE              6141
  Alloc PE / Size       0 / 0
  Free  PE / Size       6141 / 23.99 GiB
  VG UUID               vfZYLD-jxzl-awqq-NeXS-7HeK-tunE-aO3zYG
```

```console
$ sudo vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "lvg-extvol" using metadata type lvm2
```

#### create logical volume

```console
$ sudo lvcreate -n extvol -l 100%FREE lvg-extvol
  Logical volume "extvol" created.
```

```console
$ sudo lvdisplay
  --- Logical volume ---
  LV Path                /dev/lvg-extvol/extvol
  LV Name                extvol
  VG Name                lvg-extvol
  LV UUID                c0AUWG-xkZC-4Th0-5vRT-pjb4-2mWW-YcTbXM
  LV Write Access        read/write
  LV Creation host, time ip-172-31-14-198, 2021-01-07 16:42:32 +0000
  LV Status              available
  # open                 0
  LV Size                23.99 GiB
  Current LE             6141
  Segments               3
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0
```

```console
$ sudo lvscan
  ACTIVE            '/dev/lvg-extvol/extvol' [23.99 GiB] inherit
```

#### create filesystem

```console
$ sudo mkfs.ext4 /dev/lvg-extvol/extvol
mke2fs 1.41.12 (17-May-2010)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
1572864 inodes, 6288384 blocks
314419 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=4294967296
192 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
	4096000

Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 34 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
``` 

#### mount

```console
$ sudo mkdir /mnt/extvol
$ sudo mount /dev/lvg-extvol/extvol !$
```
```console
$ sudo cp /etc/fstab{,bak}
```

```console
$ echo -e "$(sudo blkid |grep mapper|awk '{print $2}') /mnt/extvol ext4 defaults 0 0" | sudo tee -a /etc/fstab
```

```console
$ cat /etc/fstab

#
# /etc/fstab
# Created by anaconda on Sat Feb 29 12:03:30 2020
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
UUID=92c597ca-70f5-48ee-a173-64188df8ca55 /                       ext4    defaults        1 1
tmpfs                   /dev/shm                tmpfs   defaults        0 0
devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
sysfs                   /sys                    sysfs   defaults        0 0
proc                    /proc                   proc    defaults        0 0
UUID="cc62cb2d-71cd-4b08-96a2-0746e0128e0a" /mnt/extvol ext4 defaults 0 0
```

```console
$ sudo reboot
```

```console
$ df -hT
Filesystem           Type   Size  Used Avail Use% Mounted on
/dev/xvda1           ext4   7.8G  867M  6.6G  12% /
tmpfs                tmpfs  1.8G     0  1.8G   0% /dev/shm
/dev/mapper/lvg--extvol-extvol
                     ext4    24G   44M   23G   1% /mnt/extvol
```
### create dummy files
```console
$ cd /mnt/extvol
```
```console
$ sudo dd if=/dev/zero of=1GBdummyfile bs=64M count=16
16+0 records in
16+0 records out
1073741824 bytes (1.1 GB) copied, 7.76699 s, 138 MB/s
```
```console
$ sudo dd if=/dev/urandom of=1GBdummyfilernd1 bs=64M count=16 iflag=fullblock
16+0 records in
16+0 records out
1073741824 bytes (1.1 GB) copied, 101.747 s, 10.6 MB/s
```
```console
$ df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/xvda1            7.8G  867M  6.6G  12% /
tmpfs                 1.8G     0  1.8G   0% /dev/shm
/dev/mapper/lvg--extvol-extvol
                       24G  2.1G   21G  10% /mnt/extvol
```
## CentOS 6.x extend lvm

```console
$ aws ec2 create-volume --availability-zone us-east-2a --volume-type gp2 --size 8 --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=lvm}]' | jq -r '.VolumeId'
vol-09a2c59b611974d26
```

```console
$ id=i-08b28662df23e2c4f; aws ec2 attach-volume --device "/dev/sdi" --instance-id $id  --volume-id vol-09a2c59b611974d26
{
    "AttachTime": "2021-01-07T17:30:24.988000+00:00",
    "Device": "/dev/sdi",
    "InstanceId": "i-08b28662df23e2c4f",
    "State": "attaching",
    "VolumeId": "vol-09a2c59b611974d26"
}
```
```console
$ sudo parted -s -a optimal /dev/xvdi -- mklabel msdos mkpart primary ext4 1 -1 set 1 lvm on
```

```console
$ sudo pvcreate /dev/xvdi1
  Physical volume "/dev/xvdi1" successfully created
```
```console
$ sudo vgdisplay -s
  "lvg-extvol" 23.99 GiB [23.99 GiB used / 0    free]
```
```console
$ sudo vgextend lvg-extvol /dev/xvdi1
  Volume group "lvg-extvol" successfully extended
```
```console
$ sudo vgdisplay -s
  "lvg-extvol" 31.98 GiB [23.99 GiB used / 8.00 GiB free]
```
```console
$ sudo lvextend -r -l 100%VG /dev/lvg-extvol/extvol
  Size of logical volume lvg-extvol/extvol unchanged from 31.98 GiB (8188 extents).
  Logical volume extvol successfully resized.
resize2fs 1.41.12 (17-May-2010)
Filesystem at /dev/mapper/lvg--extvol-extvol is mounted on /mnt/extvol; on-line resizing required
old desc_blocks = 2, new_desc_blocks = 2
Performing an on-line resize of /dev/mapper/lvg--extvol-extvol to 8384512 (4k) blocks.
The filesystem on /dev/mapper/lvg--extvol-extvol is now 8384512 blocks long.
```
```console
$ df -hT
Filesystem           Type   Size  Used Avail Use% Mounted on
/dev/xvda1           ext4   7.8G  867M  6.6G  12% /
tmpfs                tmpfs  1.8G     0  1.8G   0% /dev/shm
/dev/mapper/lvg--extvol-extvol
                     ext4    32G  2.1G   28G   7% /mnt/extvol
```

## clean up
```console
$ sudo umount /mnt/extvol/
```
```console
$ sudo sed -e '$d' -i /etc/fstab
```
```console
$ cat /etc/fstab

#
# /etc/fstab
# Created by anaconda on Sat Feb 29 12:03:30 2020
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
UUID=92c597ca-70f5-48ee-a173-64188df8ca55 /                       ext4    defaults        1 1
tmpfs                   /dev/shm                tmpfs   defaults        0 0
devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
sysfs                   /sys                    sysfs   defaults        0 0
proc                    /proc                   proc    defaults        0 0
```
```console
$ sudo lvscan
  ACTIVE            '/dev/lvg-extvol/extvol' [31.98 GiB] inherit
```

```console
$ sudo lvremove -f lvg-extvol/extvol
  Logical volume "extvol" successfully removed
```

```console
$ for v in {f..i}; do sudo parted -s -a optimal /dev/xvd${v} -- rm 1; done
```

```console
$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
xvdf    202:80   0   8G  0 disk
xvdg    202:96   0   8G  0 disk
xvdh    202:112  0   8G  0 disk
xvdi    202:128  0   8G  0 disk
```

```console
$  echo vol-09c34aa6aaf116a1e vol-004b20e6bb460d21d vol-0ff8b58780a0727a1 vol-09a2c59b611974d26 | xargs -n 1 | xargs -I{} aws ec2 detach-volume --volume-id {}
{
    "AttachTime": "2021-01-07T11:05:06+00:00",
    "Device": "/dev/sdf",
    "InstanceId": "i-08b28662df23e2c4f",
    "State": "detaching",
    "VolumeId": "vol-09c34aa6aaf116a1e"
}
{
    "AttachTime": "2021-01-07T11:05:07+00:00",
    "Device": "/dev/sdg",
    "InstanceId": "i-08b28662df23e2c4f",
    "State": "detaching",
    "VolumeId": "vol-004b20e6bb460d21d"
}
{
    "AttachTime": "2021-01-07T11:05:08+00:00",
    "Device": "/dev/sdh",
    "InstanceId": "i-08b28662df23e2c4f",
    "State": "detaching",
    "VolumeId": "vol-0ff8b58780a0727a1"
}
{
    "AttachTime": "2021-01-07T17:30:24+00:00",
    "Device": "/dev/sdi",
    "InstanceId": "i-08b28662df23e2c4f",
    "State": "detaching",
    "VolumeId": "vol-09a2c59b611974d26"
}
```
```console
$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
```

```console
$ echo vol-09c34aa6aaf116a1e vol-004b20e6bb460d21d vol-0ff8b58780a0727a1 vol-09a2c59b611974d26| xargs -n 1 | xargs -I{} aws ec2 delete-volume --volume-id {}
```
