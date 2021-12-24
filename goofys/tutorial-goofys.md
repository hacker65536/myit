# goofys

https://github.com/kahing/goofys


tutorial
====


https://dev.classmethod.jp/articles/setting-goofys-with-al2/


```console
sudo yum install -y golang fuse
```

```console
sudo wget https://github.com/kahing/goofys/releases/download/v0.24.0/goofys -P /usr/local/bin/
sudo chmod 755 /usr/local/bin/goofys
```

```console
sudo mkdir /mnt/goofys
```


```console
sudo cp /etc/fstab{,org}
```

```console
goofys#bucket   /mnt/mountpoint        fuse     _netdev,allow_other,--file-mode=0666,--dir-mode=0777    0       0
```
