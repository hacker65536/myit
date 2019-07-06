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
ubuntu@ip-172-31-4-31:~$ sudo apt update
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
