

##require 

[install jq](https://github.com/hacker65536/myit/blob/master/javascript/jq.md)  
need IAMrole for ontrol EBS



##attach ebs

```bash
ebssize=20
thisAz=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.availabilityZone'| tr -d '\"')
thisReg=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.region' | tr -d '\"')
thisId=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.instanceId'|tr -d '"')
vid=$(aws ec2 create-volume --size ${ebssize} --volume-type gp2 --availability-zone ${thisAz} --region ${thisReg} | jq '.VolumeId'| tr -d '"')
aws ec2 attach-volume --volume-id ${vid} --instance-id ${thisId} --device /dev/xvdf --region ${thisReg}

sleep 15
```

```bash
lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
xvdf    202:80   0  20G  0 disk
```

###mkfs
```bash
 mkfs.ext4 /dev/xvdf
mke2fs 1.42.12 (29-Aug-2014)
Creating filesystem with 5242880 4k blocks and 1310720 inodes
Filesystem UUID: 99f2768f-21e0-40a9-abd5-2667e5205bee
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
```

###mount
```bash
mkdir /mnt/gitdata
mount /dev/xvdf /mnt/gitdata
```
