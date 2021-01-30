
tutorial
--

### make dir with overlay 

```console
$ lsmod |grep overlay
overlay               135168  1
```

```console
$ mkdir lower upper work merged
```

```console
$ sudo mount -t overlay overlay -o lowerdir=lower,upperdir=upper,workdir=work merged
```

```console
$ mount -l | grep overlay
overlay on /home/ec2-user/merged type overlay (rw,relatime,lowerdir=lower,upperdir=upper,workdir=work)
```


### test1
```console
$ touch merged/README.md
$ mkdir merged/testdir
```

```console
$ ls -la merged
.rw-rw-r-- 0 ec2-user 30 Jan 17:10 README.md
drwxrwxr-x - ec2-user 30 Jan 17:10 testdir
```

```console
$ ls -la upper
.rw-rw-r-- 0 ec2-user 30 Jan 17:10 README.md
drwxrwxr-x - ec2-user 30 Jan 17:10 testdir
```

```console
$ ls -la lower
```

```console
$ touch lower/lowertestfile
```

``console
$ ls -la upper
.rw-rw-r-- 0 ec2-user 30 Jan 17:10 README.md
drwxrwxr-x - ec2-user 30 Jan 17:10 testdir
```
```console
$ ls -la merged
.rw-rw-r-- 0 ec2-user 30 Jan 17:21 lowertestfile
.rw-rw-r-- 0 ec2-user 30 Jan 17:10 README.md
drwxrwxr-x - ec2-user 30 Jan 17:10 testdir
```

```console
$ rm merged/lowertestfile
```
```console
$ ls -la merged
.rw-rw-r-- 0 ec2-user 30 Jan 17:10 README.md
drwxrwxr-x - ec2-user 30 Jan 17:10 testdir
```
```console
$ ls -la upper
c--------- 0,0 root     30 Jan 17:24 lowertestfile
.rw-rw-r--   0 ec2-user 30 Jan 17:10 README.md
drwxrwxr-x   - ec2-user 30 Jan 17:10 testdir
```

```console
$ ls -la lower
.rw-rw-r-- 0 ec2-user 30 Jan 17:21 lowertestfile
```


### test2 read only overlay

```console
$ mkdir lower{1,2} merged
```

```console
$ sudo mount -t overlay overlay -o lowerdir=lower1:lower2  merged
```

```console
$ mount -l | grep overlay
overlay on /home/ec2-user/overlay/merged type overlay (ro,relatime,lowerdir=lower1:lower2)
```

```console
$ touch lower1/lower1file
```

```console
$ touch lower2/lower2file
```

```console
$ ls -la merged
.rw-rw-r-- 0 ec2-user 30 Jan 17:48 lower1file
.rw-rw-r-- 0 ec2-user 30 Jan 17:49 lower2file
```

```console
$ rm merged/lower1file
rm: cannot remove ‘merged/lower1file’: Read-only file system
```
