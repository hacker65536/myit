
-L level
```
[centos@ip-172-31-30-136 ~]$ cd / && tree -L 1
.
├── bin -> usr/bin
├── boot
├── dev
├── etc
├── home
├── lib -> usr/lib
├── lib64 -> usr/lib64
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin -> usr/sbin
├── srv
├── sys
├── tmp
├── usr
└── var

19 directories, 0 files
```


```
[centos@ip-172-31-30-136 ~]$ cd /usr/local/ && tree -L 2
.
├── bin
├── etc
├── games
├── include
├── lib
├── lib64
├── libexec
├── sbin
├── share
│   ├── applications
│   ├── info
│   └── man
└── src

13 directories, 0 files
```
