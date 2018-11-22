https://docs.docker.com/install/linux/docker-ce/centos/#uninstall-old-versions



amazon linux 2

```console
$ sudo amazon-linux-extra install docker
$ sudo sytemctl start docker
$ sudo usermod -a -G docker ec2-user
$ newgrp docker # or relogin
```


```console
$ id
uid=1000(ec2-user) gid=1000(ec2-user) groups=1000(ec2-user),4(adm),10(wheel),190(systemd-journal),993(docker)
```

```console
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
