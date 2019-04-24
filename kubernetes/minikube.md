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


### version
```console
⋊> ~ docker --version                                                                                          01:22:55
Docker version 18.09.2, build 6247962
⋊> ~ docker-compose --version                                                                                  01:23:05
docker-compose version 1.23.2, build 1110ad01
⋊> ~ docker-machine --version                                                                                  01:23:09
docker-machine version 0.16.1, build cce350d7
⋊> ~ minikube version                                                                                          01:23:14
minikube version: v1.0.0
⋊> ~ kubectl version --client                                                                                  01:23:18
Client Version: version.Info{Major:"1", Minor:"14", GitVersion:"v1.14.1", GitCommit:"b7394102d6ef778017f2ca4046abbaa23b88c290", GitTreeState:"clean", BuildDate:"2019-04-19T22:13:37Z", GoVersion:"go1.12.4", Compiler:"gc", Platform:"darwin/amd64"}
```


```console
⋊> ~ minikube start                                                                                            01:23:21
😄  minikube v1.0.0 on darwin (amd64)
🤹  Downloading Kubernetes v1.14.0 images in the background ...
🔥  Creating virtualbox VM (CPUs=2, Memory=2048MB, Disk=20000MB) ...
📶  "minikube" IP address is 192.168.99.100
🐳  Configuring Docker as the container runtime ...
🐳  Version of container runtime is 18.06.2-ce
⌛  Waiting for image downloads to complete ...
✨  Preparing Kubernetes environment ...
💾  Downloading kubeadm v1.14.0
💾  Downloading kubelet v1.14.0
🚜  Pulling images required by Kubernetes v1.14.0 ...
🚀  Launching Kubernetes v1.14.0 using kubeadm ...
⌛  Waiting for pods: apiserver proxy etcd scheduler controller dns
🔑  Configuring cluster permissions ...
🤔  Verifying component health .....
💗  kubectl is now configured to use "minikube"
🏄  Done! Thank you for using minikube!
```
```console
⋊> ~ kubectl get nodes                                                                                         01:27:44
NAME       STATUS   ROLES    AGE     VERSION
minikube   Ready    master   2m41s   v1.14.0
```
