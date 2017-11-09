centos6
--------

```
[centos@ip-172-31-46-149 ~]$ cat /etc/redhat-release
CentOS release 6.9 (Final)
[centos@ip-172-31-46-149 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
[centos@ip-172-31-46-149 ~]$ sudo tune2fs -l /dev/xvda1
tune2fs 1.41.12 (17-May-2010)
Filesystem volume name:   <none>
Last mounted on:          /
Filesystem UUID:          b48e599f-bd30-4876-9a63-ecd015ba7454
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent flex_bg sparse_super large_file huge_file uninit_bg dir_nlink extra_isize
Filesystem flags:         signed_directory_hash
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              524288
Block count:              2096896
Reserved block count:     104844
Free blocks:              1861019
Free inodes:              505729
First block:              0
Block size:               4096
Fragment size:            4096
Reserved GDT blocks:      511
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         8192
Inode blocks per group:   512
Flex block group size:    16
Filesystem created:       Mon May  1 18:49:19 2017
Last mount time:          Thu Nov  9 03:43:42 2017
Last write time:          Mon May  1 18:53:08 2017
Mount count:              4
Maximum mount count:      -1
Last checked:             Mon May  1 18:49:19 2017
Check interval:           0 (<none>)
Lifetime writes:          8 GB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:               256
Required extra isize:     28
Desired extra isize:      28
Journal inode:            8
Default directory hash:   half_md4
Directory Hash Seed:      652c566d-b937-464c-8c8a-e395c151f17c
Journal backup:           inode blocks
```


- Mount Count: 4
- Maximum mount count: -1
- Last checked:  Mon May  1 18:49:19 2017
- Check interval: 0 (<none>)



maximum mount count -> 0 (-1)
check interval -> 0 
```
tune2fs -c 0 -i 0 /dev/xvda1
```


