# podman 

https://podman.io/

## installation

```
brew install podman
```

### amz2

```console
$ sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/CentOS_7/devel:kubic:libcontainers:stable.repo
$ sudo yum -y install yum-plugin-copr
$ sudo yum -y copr enable lsm5/container-selinux
$ sudo yum -y install podman
```

```console
$ sudo amazon-linux-extras install kernel-ng
```

enable user namespace
```console 
$ sudo grubby --update-kernel=ALL \
   --args="systemd.unified_cgroup_hierarchy=1 namespace.unpriv_enable=1 user_namespace.enable=1"
```
```console
$ echo "user.max_user_namespaces=10000" | sudo tee /etc/sysctl.d/98-userns.conf
```

```console
$ echo "$(id -un):100000:65536" | sudo tee -a /etc/subuid
$ echo "$(id -un):100000:65536" | sudo tee -a /etc/subgid
```


```console
$ sudo systemctl reboot
```
### ubuntu
```console
$ source /etc/os-release
$ echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
$ curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get -y upgrade 
$ sudo apt-get -y install podman
```

## usage

```console
$ man podman
```

search 
```console
$ podman search httpd --filter=is-official
INDEX       NAME                      DESCRIPTION                      STARS   OFFICIAL   AUTOMATED
docker.io   docker.io/library/httpd   The Apache HTTP Server Project   3162    [OK]
```

```console
$ podman run --rm -it hello-world
Trying to pull registry.fedoraproject.org/hello-world...
  manifest unknown: manifest unknown
Trying to pull registry.access.redhat.com/hello-world...
  name unknown: Repo not found
Trying to pull registry.centos.org/hello-world...
  manifest unknown: manifest unknown
Trying to pull docker.io/library/hello-world...
Getting image source signatures
Copying blob 0e03bdcc26d7 done
Copying config bf756fb1ae done
Writing manifest to image destination
Storing signatures

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```



ubuntu

```console
$ podman search httpd --filter=is-official
INDEX       NAME                      DESCRIPTION                      STARS   OFFICIAL   AUTOMATED
docker.io   docker.io/library/httpd   The Apache HTTP Server Project   3163    [OK]
```
```console 
$ podman pull docker.io/library/httpd
Trying to pull docker.io/library/httpd...
Getting image source signatures
Copying blob b5fc3125d912 done
Copying blob 76291586768e done
Copying blob 3d3fecf6569b done
Copying blob 679d69c01e90 done
Copying blob bf5952930446 done
Copying config a6ea92c35c done
Writing manifest to image destination
Storing signatures
a6ea92c35c43206ac8a508b2be7d6d6b5ecf5f40e7a9042a35669bcbcb2da201
```

```console
$ podman run -dt -p 8080:80/tcp docker.io/library/httpd
0016d04d3d93a54fe9a78799f221f8bc766feafe690cd76a0cc450a5127b715f
```
```console
$ curl http://localhost:8080
<html><body><h1>It works!</h1></body></html>
```


##  ref

https://aws.amazon.com/jp/premiumsupport/knowledge-center/ec2-al2-install-podman/

https://github.com/containers/podman/issues/3890

https://github.com/containers/podman/issues/3421
