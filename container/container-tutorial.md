# container tutorial (with aws)

https://employment.en-japan.com/engineerhub/entry/2019/02/05/103000



prepare
--


run instance (ubuntu18)

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
ubuntu@ip-172-31-12-65:~$ ROOTFS=$(mktemp -d | tee /dev/tty)
/tmp/tmp.OOAu6NSMc8
```


```console
ubuntu@ip-172-31-12-65:~$ sudo apt install -y docker.io
```

```console
ubuntu@ip-172-31-12-65:~$ sudo usermod -a -G docker ubuntu
ubuntu@ip-172-31-12-65:~$ newgrp docker
```

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
ubuntu@ip-172-31-12-65:~$ docker export bash | tar -x -C $ROOTFS
```

```console
ubuntu@ip-172-31-12-65:~$ sudo apt install -y cgroup-tools
```
