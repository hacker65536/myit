# cpio 

copy files to and from archives


## example


```console
$ mkdir cpio
$ cd cpio
```

```console
$ head -c 10m /dev/urandom > r
```

```console
$ split -d r ram
```

```console
$ ls -la
total 20576
drwxrwxr-x  2 ec2-user ec2-user     4096 Jul 25 06:19 .
drwx------ 63 ec2-user ec2-user     4096 Jul 25 06:14 ..
-rw-rw-r--  1 ec2-user ec2-user 10485760 Jul 25 06:18 r
-rw-rw-r--  1 ec2-user ec2-user   254827 Jul 25 06:19 ram00
-rw-rw-r--  1 ec2-user ec2-user   242231 Jul 25 06:19 ram01
-rw-rw-r--  1 ec2-user ec2-user   265110 Jul 25 06:19 ram02
-rw-rw-r--  1 ec2-user ec2-user   239645 Jul 25 06:19 ram03
-rw-rw-r--  1 ec2-user ec2-user   258407 Jul 25 06:19 ram04
-rw-rw-r--  1 ec2-user ec2-user   266564 Jul 25 06:19 ram05
-rw-rw-r--  1 ec2-user ec2-user   251510 Jul 25 06:19 ram06
-rw-rw-r--  1 ec2-user ec2-user   253684 Jul 25 06:19 ram07
-rw-rw-r--  1 ec2-user ec2-user   257659 Jul 25 06:19 ram08
-rw-rw-r--  1 ec2-user ec2-user   254283 Jul 25 06:19 ram09
-rw-rw-r--  1 ec2-user ec2-user   250546 Jul 25 06:19 ram10
-rw-rw-r--  1 ec2-user ec2-user   259154 Jul 25 06:19 ram11
-rw-rw-r--  1 ec2-user ec2-user   250375 Jul 25 06:19 ram12
-rw-rw-r--  1 ec2-user ec2-user   253072 Jul 25 06:19 ram13
-rw-rw-r--  1 ec2-user ec2-user   257678 Jul 25 06:19 ram14
-rw-rw-r--  1 ec2-user ec2-user   265162 Jul 25 06:19 ram15
-rw-rw-r--  1 ec2-user ec2-user   241643 Jul 25 06:19 ram16
-rw-rw-r--  1 ec2-user ec2-user   250295 Jul 25 06:19 ram17
-rw-rw-r--  1 ec2-user ec2-user   239776 Jul 25 06:19 ram18
-rw-rw-r--  1 ec2-user ec2-user   259718 Jul 25 06:19 ram19
-rw-rw-r--  1 ec2-user ec2-user   234278 Jul 25 06:19 ram20
-rw-rw-r--  1 ec2-user ec2-user   268265 Jul 25 06:19 ram21
-rw-rw-r--  1 ec2-user ec2-user   256831 Jul 25 06:19 ram22
-rw-rw-r--  1 ec2-user ec2-user   246146 Jul 25 06:19 ram23
-rw-rw-r--  1 ec2-user ec2-user   263468 Jul 25 06:19 ram24
-rw-rw-r--  1 ec2-user ec2-user   254112 Jul 25 06:19 ram25
-rw-rw-r--  1 ec2-user ec2-user   252454 Jul 25 06:19 ram26
-rw-rw-r--  1 ec2-user ec2-user   266104 Jul 25 06:19 ram27
-rw-rw-r--  1 ec2-user ec2-user   260876 Jul 25 06:19 ram28
-rw-rw-r--  1 ec2-user ec2-user   248226 Jul 25 06:19 ram29
-rw-rw-r--  1 ec2-user ec2-user   265679 Jul 25 06:19 ram30
-rw-rw-r--  1 ec2-user ec2-user   269398 Jul 25 06:19 ram31
-rw-rw-r--  1 ec2-user ec2-user   248825 Jul 25 06:19 ram32
-rw-rw-r--  1 ec2-user ec2-user   250339 Jul 25 06:19 ram33
-rw-rw-r--  1 ec2-user ec2-user   253153 Jul 25 06:19 ram34
-rw-rw-r--  1 ec2-user ec2-user   258073 Jul 25 06:19 ram35
-rw-rw-r--  1 ec2-user ec2-user   259361 Jul 25 06:19 ram36
-rw-rw-r--  1 ec2-user ec2-user   253873 Jul 25 06:19 ram37
-rw-rw-r--  1 ec2-user ec2-user   260244 Jul 25 06:19 ram38
-rw-rw-r--  1 ec2-user ec2-user   257010 Jul 25 06:19 ram39
-rw-rw-r--  1 ec2-user ec2-user   259560 Jul 25 06:19 ram40
-rw-rw-r--  1 ec2-user ec2-user    28146 Jul 25 06:19 ram41
```


```console
$ find . -name "ram*" | cpio -oa > /tmp/backup.cpio
20483 blocks
```

```console
$ ls -la /tmp/backup.cpio
-rw-rw-r-- 1 ec2-user ec2-user 10487296 Jul 25 06:19 /tmp/backup.cpio
```

```console
$ cpio -it < /tmp/backup.cpio
ram00
ram01
ram02
ram03
ram04
ram05
ram06
ram07
ram08
ram09
ram10
ram11
ram12
ram13
ram14
ram15
ram16
ram17
ram18
ram19
ram20
ram21
ram22
ram23
ram24
ram25
ram26
ram27
ram28
ram29
ram30
ram31
ram32
ram33
ram34
ram35
ram36
ram37
ram38
ram39
ram40
ram41
20483 blocks
```

```console
$ mkdir restore
$ cd restore
```

```console
$ cpio -im </tmp/backup.cpio ram15
$ cpio -im </tmp/backup.cpio ram41
```
```console
$ ls -la
total 292
drwxrwxr-x 2 ec2-user ec2-user     32 Jul 25 06:25 .
drwxrwxr-x 3 ec2-user ec2-user   4096 Jul 25 06:25 ..
-rw-rw-r-- 1 ec2-user ec2-user 265162 Jul 25 06:19 ram15
-rw-rw-r-- 1 ec2-user ec2-user  28146 Jul 25 06:19 ram41
```
