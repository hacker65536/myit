# installing from source

https://golang.org/doc/install/source

# install from yum repo

https://go-repo.io/

amazonlinux2

```console 
$ sudo rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
$ curl -s https://mirror.go-repo.io/centos/go-repo.repo | sudo tee /etc/yum.repos.d/go-repo.repo
$ sudo sed -e 's/\$releasever/7/' -i /etc/yum.repos.d/go-repo.repo  #amzlinu2
$ sudo yum install gcc # before install golang 1.11 from outside of amzn2-core
$ sudo yum install golang --disablerepo=amzn2-core,amzn2extra-golang1.9 --enablerepo=go-repo
```


# installation of binary

```bash
VERSION=1.8.3
OS=linux
ARCH=amd64
```


## Installing to a custom location
```
curl -s -O https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz
tar zxvf !:t
echo -e 'export GOROOT=$HOME/go\nexport PATH=$PATH:$GOROOT/bin' >> ~/.bashrc
. ~/.bashrc
```

## install to global env
```
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

testcode
```go
// You can edit this code!
// Click here and start typing.
package main

import "fmt"

func main() {
	fmt.Println("Hello, 世界")
}
```



