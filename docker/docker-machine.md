
```
sudo su -
```

```
curl -L https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m` >/usr/local/bin/docker-machine && \
chmod +x /usr/local/bin/docker-machine
```

```
docker-machine --version
```


```
docker-machine create --driver generic --generic-ssh-user ubuntu  --generic-ip-address=172.31.7.5 ubuntu
docker-machine --debug create --driver generic --generic-ssh-user centos  --generic-ip-address=172.31.18.144 cent7
```
