
```
$ sudo mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
mv: inter-device move failed: 'docker-compose-Linux-x86_64' to '/usr/local/bin/docker-compose'; unab       
```



```
$ sudo mount |grep "/usr"
cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/usr/lib/systemd/systemd-cgroups-agent,name=systemd)
/dev/mapper/usr on /usr type ext4 (ro,relatime,seclabel,block_validity,delalloc,barrier,user_xattr,acl)
/dev/xvda6 on /usr/share/oem type ext4 (rw,nodev,relatime,seclabel,commit=600,data=ordered)
```

`/dev/mapper/usr on /usr type ext4 (ro,relatime,seclabel,block_validity,delalloc,barrier,user_xattr,acl)`




```
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/bin
```

```
$ sudo mkdir -p /opt/bin
$ sudo mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
$ sudo chmod +x !$
$ docker-compose --version
docker-compose version 1.15.0, build e12f3b9
```
