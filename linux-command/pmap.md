```
# pmap -x 30171
30171:   sshd: ec2-user@pts/0
Address           Kbytes     RSS   Dirty Mode   Mapping
000055a00162c000     768     572       0 r-x--  sshd
000055a00162c000     768       0       0 r-x--  sshd
000055a0018eb000      16      16      16 r----  sshd
000055a0018eb000      16       0       0 r----  sshd
000055a0018ef000       4       4       4 rw---  sshd
000055a0018ef000       4       0       0 rw---  sshd
000055a0018f0000      40      40      40 rw---    [ anon ]
000055a0018f0000      40       0       0 rw---    [ anon ]
000055a001a3d000     256     220     220 rw---    [ anon ]
000055a001a3d000     256       0       0 rw---    [ anon ]
00007fb202bc0000    1280       0       0 rw-s-  zero (deleted)
00007fb202bc0000    1280       0       0 rw-s-  zero (deleted)
00007fb202d00000      12       0       0 r-x--  pam_lastlog.so
00007fb202d00000      12       0       0 r-x--  pam_lastlog.so
00007fb202d03000    2044       0       0 -----  pam_lastlog.so
00007fb202d03000    2044       0       0 -----  pam_lastlog.so
00007fb202f02000       4       4       4 r----  pam_lastlog.so
00007fb202f02000       4       0       0 r----  pam_lastlog.so
00007fb202f03000       4       4       4 rw---  pam_lastlog.so
00007fb202f03000       4       0       0 rw---  pam_lastlog.so
00007fb202f04000      16       0       0 r-x--  pam_limits.so
---snip---
00007ffc8e7ce000       8       4       0 r-x--    [ anon ]
00007ffc8e7ce000       8       0       0 r-x--    [ anon ]
ffffffffff600000       4       0       0 r-x--    [ anon ]
ffffffffff600000       4       0       0 r-x--    [ anon ]
----------------  ------  ------  ------
total kB 18014124285798864    3948    1136
```

```
# pmap -d 30171
30171:   sshd: ec2-user@pts/0
Address           Kbytes Mode  Offset           Device    Mapping
000055a00162c000     768 r-x-- 0000000000000000 0ca:00001 sshd
000055a0018eb000      16 r---- 00000000000bf000 0ca:00001 sshd
000055a0018ef000       4 rw--- 00000000000c3000 0ca:00001 sshd
000055a0018f0000      40 rw--- 0000000000000000 000:00000   [ anon ]
000055a001a3d000     256 rw--- 0000000000000000 000:00000   [ anon ]
00007fb202bc0000    1280 rw-s- 0000000000000000 000:00005 zero (deleted)
00007fb202d00000      12 r-x-- 0000000000000000 0ca:00001 pam_lastlog.so
00007fb202d03000    2044 ----- 0000000000003000 0ca:00001 pam_lastlog.so
00007fb20a04d000       4 r---- 000000000001f000 0ca:00001 ld-2.17.so
00007fb20a04e000       4 rw--- 0000000000020000 0ca:00001 ld-2.17.so
00007fb20a04f000       4 rw--- 0000000000000000 000:00000   [ anon ]
00007ffc8e791000     132 rw--- 0000000000000000 000:00000   [ stack ]
00007ffc8e7cc000       8 r---- 0000000000000000 000:00000   [ anon ]
00007ffc8e7ce000       8 r-x-- 0000000000000000 000:00000   [ anon ]
ffffffffff600000       4 r-x-- 0000000000000000 000:00000   [ anon ]
mapped: 119904K    writeable/private: 1232K    shared: 2560K
```
00007fb202f02000       4 r---- 0000000000002000 0ca:00001 pam_lastlog.so
