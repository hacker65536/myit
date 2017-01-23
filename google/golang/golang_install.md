
#installation of binary

```bash
VERSION=1.7.4
OS=linux
ARCH=amd64
```


##Installing to a custom location
```
curl -O https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz
tar zxvf !:t
echo -e 'export GOROOT=$HOME/go\nexport PATH=$PATH:$GOROOT/bin' >> ~/.bashrc
. ~/.bashrc
```

##install to global env
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

testcode
```
# go version
go version go1.6 linux/amd64
```
```go
// You can edit this code!
// Click here and start typing.
package main

import "fmt"

func main() {
	fmt.Println("Hello, 世界")
}
```


#installing from source

https://golang.org/doc/install/source

