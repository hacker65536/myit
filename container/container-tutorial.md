# container tutorial 

https://employment.en-japan.com/engineerhub/entry/2019/02/05/103000


run instance on aws ec2
--

using ubuntu18

```console
ubuntu@ip-172-31-12-65:~$ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 18.04.2 LTS
Release:	18.04
Codename:	bionic
ubuntu@ip-172-31-12-65:~$ uname -r
4.15.0-1043-aws
ubuntu@ip-172-31-12-65:~$ curl 169.254.169.254/latest/meta-data/instance-type
c5.large
```

prepare
--

- apt update
- install docker

```console
ubuntu@ip-172-31-12-65:~$ sudo apt update
Hit:1 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:3 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Get:4 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
---snip---
Fetched 17.6 MB in 3s (6,743 kB/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done
14 packages can be upgraded. Run 'apt list --upgradable' to see them.
```


```console
ubuntu@ip-172-31-12-65:~$ sudo apt install -y docker.io
```

```console
ubuntu@ip-172-31-12-65:~$ sudo usermod -a -G docker ubuntu
ubuntu@ip-172-31-12-65:~$ newgrp docker
```


extract docker image
--

- pull a docker image of bash
- create a container of bash
- export the bash container's fs and extract its tar 
- rm the container and the image

```console
ubuntu@ip-172-31-12-65:~$ docker pull bash
Using default tag: latest
latest: Pulling from library/bash
e7c96db7181b: Pull complete
34c10b69cd5f: Pull complete
2dc682800300: Pull complete
Digest: sha256:e1a53addc704467d523f441b5e6cde7448e8581131c59bcf0cb113da9e53b8e8
Status: Downloaded newer image for bash:latest
```



```console
ubuntu@ip-172-31-12-65:~$ docker create --name bash bash
5160cbdb6480270f16470c3301943a0af9472a27e5004a11c789a1d57552e39f
```
```console
ubuntu@ip-172-31-12-65:~$ ROOTFS=$(mktemp -d | tee /dev/tty)
/tmp/tmp.OOAu6NSMc8
```

```console
ubuntu@ip-172-31-12-65:~$ docker export bash | tar -x -C $ROOTFS
```
```console
ubuntu@ip-172-31-12-65:~$ ln -s /usr/local/bin/bash $ROOTFS/bin/bash
```

```console
ubuntu@ip-172-31-12-65:~$ file $ROOTFS/bin/bash
/tmp/tmp.OOAu6NSMc8/bin/bash: broken symbolic link to /usr/local/bin/bash
```
```console
ubuntu@ip-172-31-12-65:~$ docker rm bash
bash
```
```console
ubuntu@ip-172-31-12-65:~$ docker image rm bash
Untagged: bash:latest
Untagged: bash@sha256:e1a53addc704467d523f441b5e6cde7448e8581131c59bcf0cb113da9e53b8e8
Deleted: sha256:417531d957ab80b157983048939843d1f343cdf773b724252a8f3608158839e2
Deleted: sha256:a94c3e4e616f2c13f4edbd24bf6d4bbe855674dd0ed5b025f32b6fb1f80982c3
Deleted: sha256:f8b854a410f99d3784aa42c13d4b6f9dd7d15cb36066e20e0e4a3f9849c08521
Deleted: sha256:f1b5933fe4b5f49bbe8258745cf396afe07e625bdab3168e364daf7c956b6b81
```

```console
ubuntu@ip-172-31-12-65:~$ ls -la $ROOTFS/bin/bash
lrwxrwxrwx 1 ubuntu ubuntu 19 Jul  8 03:46 /tmp/tmp.OOAu6NSMc8/bin/bash -> /usr/local/bin/bash
```



create cgroup 
--
- install cgroup-tools
- create a cgroup
- create its limitations

```console
ubuntu@ip-172-31-12-65:~$ sudo apt install -y cgroup-tools
```

```console
ubuntu@ip-172-31-12-65:~$ UUID=$(uuidgen | tee  /dev/tty)
7a0424c5-c300-465c-a052-89065447c37b
```

```console
ubuntu@ip-172-31-12-65:~$ sudo cgcreate -t $(id -un):$(id -gn) -a $(id -un):$(id -gn) -g cpu,memory:$UUID
```

```console
ubuntu@ip-172-31-12-65:~$ ls -la /sys/fs/cgroup/cpu,cpuacct/$UUID/
total 0
drwxr-xr-x 2 ubuntu ubuntu 0 Jul  6 18:17 .
dr-xr-xr-x 5 root   root   0 Jul  6 18:18 ..
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cgroup.clone_children
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cgroup.procs
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpu.cfs_period_us
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpu.cfs_quota_us
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpu.shares
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpu.stat
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpuacct.stat
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpuacct.usage
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpuacct.usage_all
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpuacct.usage_percpu
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpuacct.usage_percpu_sys
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpuacct.usage_percpu_user
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpuacct.usage_sys
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cpuacct.usage_user
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 notify_on_release
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 tasks
```


https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/6/html/resource_management_guide/sec-memory


```console
ubuntu@ip-172-31-12-65:~$ cgset -r memory.limit_in_bytes=10M $UUID
```


```console
ubuntu@ip-172-31-12-65:~$ ls -la /sys/fs/cgroup/memory/$UUID/
total 0
drwxr-xr-x 2 ubuntu ubuntu 0 Jul  6 18:17 .
dr-xr-xr-x 5 root   root   0 Jul  6 18:18 ..
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cgroup.clone_children
--w--w--w- 1 ubuntu ubuntu 0 Jul  6 18:17 cgroup.event_control
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 cgroup.procs
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.failcnt
--w------- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.force_empty
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.kmem.failcnt
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.kmem.limit_in_bytes
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.kmem.max_usage_in_bytes
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.kmem.slabinfo
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.kmem.tcp.failcnt
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.kmem.tcp.limit_in_bytes
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.kmem.tcp.max_usage_in_bytes
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.kmem.tcp.usage_in_bytes
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.kmem.usage_in_bytes
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.limit_in_bytes
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.max_usage_in_bytes
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.move_charge_at_immigrate
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.numa_stat
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.oom_control
---------- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.pressure_level
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.soft_limit_in_bytes
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.stat
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.swappiness
-r--r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.usage_in_bytes
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 memory.use_hierarchy
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 notify_on_release
-rw-r--r-- 1 ubuntu ubuntu 0 Jul  6 18:17 tasks
```
```console
ubuntu@ip-172-31-12-65:~$ cat /sys/fs/cgroup/memory/$UUID/memory.limit_in_bytes
10485760
```

https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/6/html/resource_management_guide/sec-cpu


`1sec=1,000,000μs`  
`0.3 = 300000 cfs_quota_us /1000000 cfs_period_us`
```console
ubuntu@ip-172-31-12-65:~$ cgset -r cpu.cfs_period_us=1000000 $UUID
ubuntu@ip-172-31-12-65:~$ cat /sys/fs/cgroup/cpu,cpuacct/$UUID/cpu.cfs_period_us
1000000
```
```console
ubuntu@ip-172-31-12-65:~$ cgset -r cpu.cfs_quota_us=300000 $UUID
ubuntu@ip-172-31-12-65:~$ cat /sys/fs/cgroup/cpu,cpuacct/$UUID/cpu.cfs_quota_us
300000
```


run bash container
--


```console
ubuntu@ip-172-31-12-65:~$ cgexec -g cpu,memory:$UUID   unshare -muinpfr /bin/sh -c "
    mount -t proc proc $ROOTFS/proc &&
    touch $ROOTFS$(tty); mount --bind $(tty) $ROOTFS$(tty) &&
    touch $ROOTFS/dev/pts/ptmx; mount --bind /dev/pts/ptmx $ROOTFS/dev/pts/ptmx &&
    ln -sf /dev/pts/ptmx $ROOTFS/dev/ptmx &&
    touch $ROOTFS/dev/null && mount --bind /dev/null $ROOTFS/dev/null &&
    /bin/hostname $UUID &&
    exec capsh --chroot=$ROOTFS --drop=cap_sys_chroot -- -c 'exec $CMD'
   "
```
```console
/ #
```

show status in container
--
```console
/ # ls -la /bin/bash
lrwxrwxrwx    1 root     root            19 Jul  8 03:48 /bin/bash -> /usr/local/bin/bash
```
```console
/ # uname -n
7a0424c5-c300-465c-a052-89065447c37b
```
```console
/ # id
uid=0(root) gid=0(root) groups=65534(nobody),65534(nobody),65534(nobody),65534(nobody),65534(nobody),65534(nobody),65534(nobody),65534(nobody),65534(nobody),65534(nobody),65534(nobody),65534(nobody),0(root)
```
```console
/ # ps aux
PID   USER     TIME  COMMAND
    1 root      0:00 /bin/sh
   15 root      0:00 ps aux
```
```console
/ # mount
proc on /proc type proc (rw,relatime)
devpts on /dev/pts/0 type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
devpts on /dev/pts/ptmx type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
udev on /dev/null type devtmpfs (rw,nosuid,relatime,size=1885040k,nr_inodes=471260,mode=755)
```
```console
/ # ip link
1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
```


cpu utilization (30%)
--
```console
/ # yes >/dev/null
```

```console
ubuntu@ip-172-31-12-65:~$ ps f
  PID TTY      STAT   TIME COMMAND
11251 pts/1    Ss     0:00 -bash
11391 pts/1    R+     0:00  \_ ps f
10340 pts/0    Ss     0:00 -bash
11129 pts/0    S      0:00  \_ unshare -muinpfr /bin/sh -c...
11130 pts/0    S      0:00      \_ /bin/sh
11380 pts/0    R+     0:32          \_ yes
```
```console
ubuntu@ip-172-31-12-65:~$ top -p $(pidof yes)
top - 04:05:04 up 1 day, 15:09,  2 users,  load average: 0.00, 0.00, 0.00
Tasks:   1 total,   1 running,   0 sleeping,   0 stopped,   0 zombie
%Cpu(s): 14.6 us,  0.5 sy,  0.0 ni, 84.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  3794276 total,  2492096 free,   183804 used,  1118376 buff/cache
KiB Swap:        0 total,        0 free,        0 used.  3359716 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
11380 ubuntu    20   0    1520      4      0 R  30.3  0.0   0:52.50 yes
```

cleaning
--

- exit from the container
- delete the cgroup
- remove the directory of the container
```console
/ # exit
```
```console
ubuntu@ip-172-31-12-65:~$ sudo cgdelete -r -g cpu,memory:$UUID
ubuntu@ip-172-31-12-65:~$ rm -rf $ROOTFS
```



unshare
--

- -i --ipc
- -m --mount
- -n --net
- -p --pid
- -u --uts
- -U --user
- -C --cgroup
- -f --fork
- -r --map-root-user


capsh
--

- install libcap for Ambient capabilities via source
- run an unprivileged ping


```console
ubuntu@ip-172-31-12-65:~$ sudo apt install -y make gcc
```

```console
ubuntu@ip-172-31-12-65:~$ git clone https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git
Cloning into 'libcap'...
remote: Counting objects: 1228, done.
remote: Total 1228 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (1228/1228), 276.41 KiB | 3.95 MiB/s, done.
Resolving deltas: 100% (779/779), done.
```

```console
ubuntu@ip-172-31-12-65:~$ cd libcap/
ubuntu@ip-172-31-12-65:~/libcap$ make && sudo make install
```

```console
ubuntu@ip-172-31-12-65:~$ cp /bin/ping .
```
```console
ubuntu@ip-172-31-12-65:~$ ./ping -c1 127.0.0.1
ping: socket: Operation not permitted
```
```console
ubuntu@ip-172-31-12-65:~$ ls -la /bin/ping
-rwsr-xr-x 1 root root 64424 Mar  9  2017 /bin/ping
ubuntu@ip-172-31-12-65:~$ ls -la ./ping
-rwxr-xr-x 1 ubuntu ubuntu 64424 Jul  8 08:38 ./ping
```

```console
ubuntu@ip-172-31-12-65:~$ sudo capsh \
>          --caps="cap_net_raw+ip cap_setpcap,cap_setuid,cap_setgid+ep" \
>          --keep=1 --user=$USER --addamb=cap_net_raw -- \
>          -c 'id && getcap -v ./ping && grep Cap /proc/$$/status && ./ping -c1 127.0.0.1'
uid=1000(ubuntu) gid=1000(ubuntu) groups=1000(ubuntu),4(adm),20(dialout),24(cdrom),25(floppy),27(sudo),29(audio),30(dip),44(video),46(plugdev),108(lxd),114(netdev),115(docker)
./ping
CapInh: 0000000000002000
CapPrm: 0000000000002000
CapEff: 0000000000002000
CapBnd: 0000003fffffffff
CapAmb: 0000000000002000
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.022 ms

--- 127.0.0.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.022/0.022/0.022/0.000 ms
```



```console
ubuntu@ip-172-31-12-65:~$ ls -l /proc/$$/root
lrwxrwxrwx 1 ubuntu ubuntu 0 Jul  8 04:58 /proc/10340/root -> /
```
```console
ubuntu@ip-172-31-12-65:~$ awk '{ if ($5 == "/") print $0 }' /proc/$$/mountinfo
27 0 259:1 / / rw,relatime shared:1 - ext4 /dev/nvme0n1p1 rw,discard,data=ordered
```
