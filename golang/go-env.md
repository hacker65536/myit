https://golang.org/cmd/go/#hdr-Environment_variables

```console
$ go env
GOARCH="amd64"
GOBIN=""
GOCACHE="/home/ec2-user/.cache/go-build"
GOEXE=""
GOFLAGS=""
GOHOSTARCH="amd64"
GOHOSTOS="linux"
GOOS="linux"
GOPATH="/home/ec2-user/go"
GOPROXY=""
GORACE=""
GOROOT="/usr/lib/golang"
GOTMPDIR=""
GOTOOLDIR="/usr/lib/golang/pkg/tool/linux_amd64"
GCCGO="gccgo"
CC="gcc"
CXX="g++"
CGO_ENABLED="1"
GOMOD=""
CGO_CFLAGS="-g -O2"
CGO_CPPFLAGS=""
CGO_CXXFLAGS="-g -O2"
CGO_FFLAGS="-g -O2"
CGO_LDFLAGS="-g -O2"
PKG_CONFIG="pkg-config"
GOGCCFLAGS="-fPIC -m64 -pthread -fmessage-length=0 -fdebug-prefix-map=/tmp/go-build743320108=/tmp/go-build -gno-record-gcc-switches"
```

```console
$ go env GOPATH
/home/ec2-user/go
```

```console
$ echo 'export GOPATH=$(go env GOPATH)' >> ~/.bashrc
```
