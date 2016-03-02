
#installation of binary

```bash
VERSION=1.6
OS=linux
ARCH=amd64

wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

```bash
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
.  ~/.bashrc
```


#installing from source

https://golang.org/doc/install/source

