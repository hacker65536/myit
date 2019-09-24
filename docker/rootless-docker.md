
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


run nginx from docker
--

using a another terminal

```console
$ export DOCKER_HOST=unix:///run/user/1000/docker.sock
```
```console
$ docker run --rm -d -it  --name nginx -p 8080:80 nginx
```

```console
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
46ba2e4a30a8        nginx               "nginx -g 'daemon of…"   16 seconds ago      Up 15 seconds       0.0.0.0:8080->80/tcp   nginx
```

```console
$ ps axu|grep docke[r]
ec2-user  2024  0.0  0.0 110396  6820 pts/2    Sl+  07:16   0:00 rootlesskit --net=vpnkit --mtu=1500 --disable-host-loopback --port-driver=builtin --copy-up=/etc --copy-up=/run /usr/local/bin/dockerd-rootless.sh --experimental --storage-driver vfs
ec2-user  2035  0.3  0.1 112188 12020 pts/2    Sl+  07:16   0:01 /proc/self/exe --net=vpnkit --mtu=1500 --disable-host-loopback --port-driver=builtin --copy-up=/etc --copy-up=/run /usr/local/bin/dockerd-rootless.sh --experimental --storage-driver vfs
ec2-user  2095  1.4  0.9 812836 70972 pts/2    Sl+  07:16   0:05 dockerd --experimental --storage-driver vfs
ec2-user  2110  0.2  0.3 506368 27768 ?        Ssl  07:16   0:00 containerd --config /run/user/1000/docker/containerd/containerd.toml --log-level info
ec2-user  2628  0.0  0.0 108296  4568 pts/2    Sl+  07:23   0:00 /usr/local/bin/rootlesskit-docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8080 -container-ip 172.17.0.2 -container-port 80
ec2-user  2633  0.0  0.0 103304  1652 pts/2    Sl+  07:23   0:00 docker-proxy -container-ip 172.17.0.2 -container-port 80 -host-ip 127.0.0.1 -host-port 8080 -proto tcp
ec2-user  2641  0.0  0.0 108964  5768 ?        Sl   07:23   0:00 containerd-shim -namespace moby -workdir /home/ec2-user/.local/share/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby/46ba2e4a30a88cfdeab9f25465d2b4dfa4e4f4412a9d37d195e779f36eaf334c -address /run/user/1000/docker/containerd/containerd.sock -containerd-binary /usr/local/bin/containerd -runtime-root /run/user/1000/docker/runtime-runc
```


```console
$ docker info
Containers: 1
 Running: 1
 Paused: 0
 Stopped: 0
Images: 1
Server Version: dev
Storage Driver: vfs
Logging Driver: json-file
Cgroup Driver: none
Plugins:
 Volume: local
 Network: bridge host ipvlan macvlan null overlay
 Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
containerd version: 894b81a4b802e4eb2a91d1ce216b8817763c29fb
runc version: 425e105d5a03fabd737a126ad93d62a9eeede87f
init version: fec3683
Security Options:
 seccomp
  Profile: default
 rootless
Kernel Version: 4.14.138-114.102.amzn2.x86_64
Operating System: Amazon Linux 2
OSType: linux
Architecture: x86_64
CPUs: 4
Total Memory: 7.446GiB
Name: ip-172-31-7-7.us-east-2.compute.internal
ID: OGIX:ZWHC:LYK4:53F7:PNLV:WTB5:TE4F:OIN6:HJGF:COKV:OUXU:3ZAH
Docker Root Dir: /home/ec2-user/.local/share/docker
Debug Mode (client): false
Debug Mode (server): false
Registry: https://index.docker.io/v1/
Labels:
Experimental: true
Insecure Registries:
 127.0.0.0/8
Live Restore Enabled: false

WARNING: bridge-nf-call-iptables is disabled
WARNING: bridge-nf-call-ip6tables is disabled
```
