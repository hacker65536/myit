
```console
$ dd if=/dev/urandom of=100MBdummyfilernd1 bs=10M count=10 iflag=fullblock
10+0 records in
10+0 records out
104857600 bytes (105 MB) copied, 0.577052 s, 182 MB/s
```

```console
$ md5sum 100MBdummyfilernd1
c1c6af3e926c31a4ce225b82d15a9f8c  100MBdummyfilernd1
```

```
$ split -b 10MB -d 100MBdummyfilernd1 100MBfile-
```
```
$ ls -la 100MBfile*
-rw-rw-r-- 1 ec2-user ec2-user 10000000 Jul 12 10:58 100MBfile-00
-rw-rw-r-- 1 ec2-user ec2-user 10000000 Jul 12 10:58 100MBfile-01
-rw-rw-r-- 1 ec2-user ec2-user 10000000 Jul 12 10:58 100MBfile-02
-rw-rw-r-- 1 ec2-user ec2-user 10000000 Jul 12 10:58 100MBfile-03
-rw-rw-r-- 1 ec2-user ec2-user 10000000 Jul 12 10:58 100MBfile-04
-rw-rw-r-- 1 ec2-user ec2-user 10000000 Jul 12 10:58 100MBfile-05
-rw-rw-r-- 1 ec2-user ec2-user 10000000 Jul 12 10:58 100MBfile-06
-rw-rw-r-- 1 ec2-user ec2-user 10000000 Jul 12 10:58 100MBfile-07
-rw-rw-r-- 1 ec2-user ec2-user 10000000 Jul 12 10:58 100MBfile-08
-rw-rw-r-- 1 ec2-user ec2-user 10000000 Jul 12 10:58 100MBfile-09
-rw-rw-r-- 1 ec2-user ec2-user  4857600 Jul 12 10:58 100MBfile-10
```

```
$ cat 100MBfile* > 100MBfile
```
```
$ md5sum 100MBfile
c1c6af3e926c31a4ce225b82d15a9f8c  100MBfile
```
