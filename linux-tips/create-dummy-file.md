


1GB dummy file 
----

```console
$ dd if=/dev/zero of=1GBdummyfile bs=64M count=16
16+0 records in
16+0 records out
1073741824 bytes (1.1 GB) copied, 0.563475 s, 1.9 GB/s
```

random 1

```console
$ dd if=/dev/urandom of=1GBdummyfilernd1 bs=64M count=16 iflag=fullblock

16+0 records in
16+0 records out
1073741824 bytes (1.1 GB) copied, 5.79177 s, 185 MB/s
```
if without iflag
>dd: warning: partial read (33554431 bytes); suggest iflag=fullblock


random 2

```console
$ time openssl rand -out 1GBdummyfilernd2 -base64 792917038; truncate -s-1 1GBdummyfilernd2

real    0m14.642s
user    0m14.041s
sys     0m0.600s
```

```
$ ls -l 1GBdummyfile*
-rw-rw-r-- 1 ec2-user ec2-user    1042082 Jul  9 04:57 1GBdummyfile.gz
-rw-rw-r-- 1 ec2-user ec2-user 1073915563 Jul  9 04:56 1GBdummyfilernd1.gz
-rw-rw-r-- 1 ec2-user ec2-user  816139154 Jul  9 04:59 1GBdummyfilernd2.gz
```
