# yumdownloader

download RPM packages from Yum repositories




download source
--

get package info

```console
$ rpm -qi ec2-hibinit-agent
Name        : ec2-hibinit-agent
Version     : 1.0.0
Release     : 4.amzn2
Architecture: noarch
Install Date: Thu 29 Aug 2019 10:48:27 PM UTC
Group       : System Environment/Daemons
Size        : 20963
License     : Apache 2.0
Signature   : RSA/SHA256, Mon 24 Jun 2019 11:06:28 PM UTC, Key ID 11cf1f95c87f5b1a
Source RPM  : ec2-hibinit-agent-1.0.0-4.amzn2.src.rpm
Build Date  : Fri 21 Jun 2019 09:54:32 PM UTC
Build Host  : build.amazon.com
Relocations : (not relocatable)
Packager    : Amazon Linux
Vendor      : Amazon Linux
Summary     : Hibernation setup utility for AWS EC2
Description :
An EC2 agent that creates a setup for instance hibernation
```


download source

```console
$ yumdownloader --source ec2-hibinit-agent
```

```console
$ ll
total 20
-rw-rw-r-- 1 ec2-user ec2-user 16337 Jun 26 02:29 ec2-hibinit-agent-1.0.0-4.amzn2.src.rpm
```

```console
$ rpm -ivh ec2-hibinit-agent-1.0.0-4.amzn2.src.rpm
Updating / installing...
   1:ec2-hibinit-agent-1.0.0-4.amzn2  ################################# [100%]
warning: user mockbuild does not exist - using root
warning: group mock does not exist - using root
warning: user mockbuild does not exist - using root
warning: group mock does not exist - using root
```
```console
$ tree -L 2 rpmbuild/
rpmbuild/
├── SOURCES
│   ├── ec2-hibinit-agent-1.0.0
│   └── ec2-hibinit-agent-1.0.0.tar.gz
└── SPECS
    └── hibinit-agent.spec

3 directories, 2 files
```
