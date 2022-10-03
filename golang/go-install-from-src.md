# install go from src

https://go.dev/doc/install/source

## environment
```
$ uname -a
Linux ip-172-31-47-0.us-east-2.compute.internal 5.10.135-122.509.amzn2.x86_64 #1 SMP Thu Aug 11 22:41:16 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
```

## install git

```
sudo yum install git gcc -y
```


## dl binary go for bootstrap

```
wget https://go.dev/dl/go1.14.linux-amd64.tar.gz
tar zxvf go1.14.linux-amd64.tar.gz
```

## clone repository
```
git clone https://go.googlesource.com/go goroot
cd !$
```

## checkout recently version
```console
$ git ls-remote --refs --sort="version:refname" --tags $repo|cut -d/ -f3- | grep go |grep -v -E "beta|rc"| sort -V |tail -n 10
From https://go.googlesource.com/go
go1.17.13
go1.18
go1.18.1
go1.18.2
go1.18.3
go1.18.4
go1.18.5
go1.18.6
go1.19
go1.19.1
```

```
git checkout go1.19.1
```

## compile

```
cd src
GOROOT_BOOTSTRAP=~/go ./all.bash
```


```
##### API check
Go version is "go1.19.1", ignoring -next /home/ec2-user/goroot/api/next.txt

ALL TESTS PASSED

---
Installed Go for linux/amd64 in /home/ec2-user/goroot
Installed commands in /home/ec2-user/goroot/bin
*** You need to add /home/ec2-user/goroot/bin to your PATH.
```

## set up path

```console
$ export PATH=$PATH:/home/ec2-user/goroot/bin
```

```console
$ go version
go version go1.19.1 linux/amd64
```
