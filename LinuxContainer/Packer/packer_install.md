


#install  

https://releases.hashicorp.com/packer/
```bash
wget "https://releases.hashicorp.com/packer/0.8.6/packer_0.8.6_linux_amd64.zip"
unzip packer_0.8.6_linux_amd64.zip -d /usr/local/packer
```

path
```bash
export PATH=/usr/local/packer:$PATH
```

#Setting up Go to work on Packer

install go
[ref install_go](https://github.com/hacker65536/myit/blob/master/google/golang/golang_install.md)

```
export GOPATH=$HOME/Documents/golang
export GO15VENDOREXPERIMENT=1
export PATH=$PATH:$GOPATH/bin
```
```
go get github.com/mitchellh/packer
cd $GOPATH/src/github.com/mitchellh/packer
make
```

https://github.com/mitchellh/packer/blob/master/CONTRIBUTING.md
