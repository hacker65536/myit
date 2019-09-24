
prepare pkg
--
```console
$ sudo amazon-linux-extras install -y docker golang1.11
```

experimental true
--
```console
$ cat <<'EOF' | sudo tee /etc/docker/daemon.json
{
    "experimental": true
}
EOF
```


run docker for build
--
```console
$ sudo systemctl start docker
```

chgrp 
--

```console
$ sudo usermod -a -G docker $(whoami)
$ newgrp docker
```

download source and make
--
```console
$ git clone -b v19.03.2 https://github.com/docker/engine.git
cd engine
export GOPATH=$(go env GOPATH)
make 
```

install
--
```console
sudo GOPATH=$(go env GOPATH) make install
```


stop docker (rpm)
--

```console
$ sudo systemctl stop docker
```



install shadow-utils
--

https://bugzilla.redhat.com/show_bug.cgi?id=1498628

https://github.com/opencontainers/runc/issues/1906

```console
$ rpm -qV shadow-utils
..?......    /usr/sbin/groupadd
..?......    /usr/sbin/groupdel
..?......    /usr/sbin/groupmems
..?......    /usr/sbin/groupmod
..?......    /usr/sbin/useradd
..?......    /usr/sbin/userdel
..?......    /usr/sbin/usermod
```
```console
$ rpm -qa shadow-utils
shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64
```
```console
$ wget http://fr2.rpmfind.net/linux/centos/7.7.1908/os/x86_64/Packages/shadow-utils-4.6-5.el7.x86_64.rpm
$ sudo yum install -y shadow-utils-4.6-5.el7.x86_64.rpm
```


set uid/gid map
--


```console
$ cat <<'EOF'  | sudo tee /etc/subuid
ec2-user:100000:65536
EOF
```

```console
$ cat <<'EOF'  | sudo tee /etc/subgid
ec2-user:100000:65536
EOF
```


run rootless-docker
--

```console
$ dockerd-rootless.sh --experimental --storage-driver vfs
```

```
INFO[2019-09-24T07:16:57.134012418Z] Loading containers: done.
INFO[2019-09-24T07:16:57.157688060Z] Docker daemon                                 commit=ed20165a37 graphdriver(s)=vfs version=dev
INFO[2019-09-24T07:16:57.157785421Z] Daemon has completed initialization
INFO[2019-09-24T07:16:57.174989371Z] API listen on /run/user/1000/docker.sock
```
