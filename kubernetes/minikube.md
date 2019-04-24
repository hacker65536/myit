# minikube

https://kubernetes.io/docs/tasks/tools/install-minikube/#install-minikube

https://github.com/kubernetes/minikube#other-ways-to-install


## cant install to ec2

```console
$ wget https://download.virtualbox.org/virtualbox/6.0.4/VirtualBox-6.0-6.0.4_128413_el7-1.x86_64.rpm
$ yum install VirtualBox-6.0-6.0.4_128413_el7-1.x86_64.rpm
```

```console
$ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
sudo install minikube-linux-amd64 /usr/local/bin/minikube
``` 
```console
$ minikube start
😄  minikube v0.34.1 on linux (amd64)
🔥  Creating virtualbox VM (CPUs=2, Memory=2048MB, Disk=20000MB) ...
💿  Downloading Minikube ISO ...
 184.30 MB / 184.30 MB [============================================] 100.00% 0s
💣  Unable to start VM: create: precreate: We support Virtualbox starting with version 5. Your VirtualBox install is "WARNING: The vboxdrv kernel module is not loaded. Either there is no module\n         available for the current kernel (4.14.88-88.76.amzn2.x86_64) or it failed to\n         load. Please recompile the kernel module and install it by\n\n           sudo /sbin/vboxconfig\n\n         You will not be able to start VMs until this problem is fixed.\n6.0.4r128413". Please upgrade at https://www.virtualbox.org

😿  Sorry that minikube crashed. If this was unexpected, we would love to hear from you:
👉  https://github.com/kubernetes/minikube/issues/new
```


```console
$ sudo /sbin/vboxconfig
vboxdrv.sh: Stopping VirtualBox services.
vboxdrv.sh: Starting VirtualBox services.
vboxdrv.sh: failed: Running VirtualBox in a Xen environment is not supported.
This system is currently not set up to build kernel modules.
Please install the gcc make perl packages from your distribution.
Please install the Linux kernel "header" files matching the current kernel
for adding new hardware support to the system.

There were problems setting up VirtualBox.  To re-start the set-up process, run
  /sbin/vboxconfig
as root.
```

https://stackoverflow.com/questions/7601853/can-virtualbox-be-executed-under-amazon-ec2-instance



brew (install on mac)
--

```console
$ brew install kubernetes-cli
$ brew cask install minikube docker virtualbox
```
if virtualbox installation is failure
1. open up system preferences
2. click on the security & Privacy 
3. allow apps download from App store and identified developers


```console
$  brew cask list docker
==> Apps
/Applications/Docker.app (286 files, 1.7GB)
```

run docker from application icon
```console
$ docker --version
Docker version 18.09.2, build 6247962
```
