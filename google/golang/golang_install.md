
#installation of binary

```bash
VERSION=1.6
OS=linux
ARCH=amd64

cd /usr/local/src
wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

```bash
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
.  ~/.bashrc
```

```
# go version
go version go1.6 linux/amd64
```

#installing from source

https://golang.org/doc/install/source

