ubuntu
===========

AMI
---------
http://cloud-images.ubuntu.com/locator/ec2/

`ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20180426.2 - ami-f3211396`

install docker-ce =>18
----------
```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"
sudo apt update
sudo apt install -y docker-ce
```

```
$ sudo docker version

Client:
 Version:      18.05.0-ce-rc1
 API version:  1.37
 Go version:   go1.9.5
 Git commit:   33f00ce
 Built:        Thu Apr 26 01:03:26 2018
 OS/Arch:      linux/amd64
 Experimental: false
 Orchestrator: swarm

Server:
 Engine:
  Version:      18.05.0-ce-rc1
  API version:  1.37 (minimum version 1.12)
  Go version:   go1.9.5
  Git commit:   33f00ce
  Built:        Thu Apr 26 01:01:34 2018
  OS/Arch:      linux/amd64
  Experimental: false
```

install bazel
----------
https://docs.bazel.build/versions/master/install-ubuntu.html
```
sudo apt-get install -y pkg-config zip g++ zlib1g-dev unzip python
curl -SsL -O https://github.com/bazelbuild/bazel/releases/download/0.13.0/bazel-0.13.0-installer-linux-x86_64.sh
chmod +x !$:t
./!$ --user
```
```
export PATH="$PATH:$HOME/bin"
```
```
bazel version
Build label: 0.13.0
Build target: bazel-out/k8-opt/bin/src/main/java/com/google/devtools/build/lib/bazel/BazelServer_deploy.jar
Build time: Mon Oct 18 21:33:40 +50297 (1525078013620)
Build timestamp: 1525078013620
Build timestamp as int: 1525078013620
```

build gvisor
-------
```
sudo apt-get install -y git
```
```
git clone https://gvisor.googlesource.com/gvisor gvisor
cd !$
```

```
$ bazel build runsc
Starting local Bazel server and connecting to it...
...........
INFO: Analysed target //runsc:runsc (173 packages loaded).
INFO: Found 1 target...
Target //runsc:runsc up-to-date:
  bazel-bin/runsc/linux_amd64_pure_stripped/runsc
INFO: Elapsed time: 234.541s, Critical Path: 48.53s
INFO: 648 processes: 638 linux-sandbox, 10 local.
INFO: Build completed successfully, 664 total actions
```
