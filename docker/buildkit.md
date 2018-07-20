```console
$ sudo amazon-linux-extra install docker=18.3.01
$ sudo systemctl start docker
```


```console
$ git clone https://github.com/moby/buildkit.git
$ cd !$:t:r
```

if did not start docker
```console
$ make
mkdir -p bin
docker build -t buildkit:buildkitd --target buildkitd -f ./hack/dockerfiles/test.Dockerfile --force-rm .
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
make: *** [bin/buildkitd] Error 1
```

no permission
```console
$ make
mkdir -p bin
docker build -t buildkit:buildkitd --target buildkitd -f ./hack/dockerfiles/test.Dockerfile --force-rm .
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.37/build?buildargs=%7B%7D&cachefrom=%5B%5D&cgroupparent=&cpuperiod=0&cpuquota=0&cpusetcpus=&cpusetmems=&cpushares=0&dockerfile=hack%2Fdockerfiles%2Ftest.Dockerfile&forcerm=1&labels=%7B%7D&memory=0&memswap=0&networkmode=default&rm=1&session=5fbd9e83a4dceeba65d47ef60f382d718222c2f47c0102d8b82cccc9ed187263&shmsize=0&t=buildkit%3Abuildkitd&target=buildkitd&ulimits=null: dial unix /var/run/docker.sock: connect: permission denied
make: *** [bin/buildkitd] Error 1
```

```console
$ sudo make
$ sudo make
mkdir -p bin
docker build -t buildkit:buildkitd --target buildkitd -f ./hack/dockerfiles/test.Dockerfile --force-rm .
Sending build context to Docker daemon  24.99MB
Step 1/20 : ARG RUNC_VERSION=dd56ece8236d6d9e5bed4ea0c31fe53c7b873ff4
Step 2/20 : ARG CONTAINERD_VERSION=v1.1.0
Step 3/20 : ARG CONTAINERD10_VERSION=v1.0.3
Step 4/20 : ARG BUILDKIT_TARGET=buildkitd
Step 5/20 : ARG REGISTRY_VERSION=2.6
Step 6/20 : ARG ROOTLESSKIT_VERSION=20b0fc24b305b031a61ef1a1ca456aadafaf5e77
Step 7/20 : FROM golang:1.10-alpine AS gobuild-base
1.10-alpine: Pulling from library/golang
8e3ba11ec2a2: Pull complete
8e6b2bc60854: Pull complete
3d20cafe6dc8: Pull complete
7a50139852bf: Pull complete
eda88e56e76e: Pull complete
Digest: sha256:875d980b77cea706bb05c954b485affeaf7fea054a5d65a4365141a38cea15c3
Status: Downloaded newer image for golang:1.10-alpine
 ---> 34d3217973fd
Step 8/20 : RUN apk add --no-cache g++ linux-headers
 ---> Running in de3ce0298c84
fetch http://dl-cdn.alpinelinux.org/alpine/v3.8/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.8/community/x86_64/APKINDEX.tar.gz
(1/15) Installing libgcc (6.4.0-r8)
(2/15) Installing libstdc++ (6.4.0-r8)
(3/15) Installing binutils (2.30-r5)
(4/15) Installing gmp (6.1.2-r1)
(5/15) Installing isl (0.18-r0)
(6/15) Installing libgomp (6.4.0-r8)
(7/15) Installing libatomic (6.4.0-r8)
(8/15) Installing pkgconf (1.5.1-r0)
(9/15) Installing mpfr3 (3.1.5-r1)
(10/15) Installing mpc1 (1.0.3-r1)
(11/15) Installing gcc (6.4.0-r8)
(12/15) Installing musl-dev (1.1.19-r10)
(13/15) Installing libc-dev (0.7.1-r0)
(14/15) Installing g++ (6.4.0-r8)
(15/15) Installing linux-headers (4.4.6-r2)
Executing busybox-1.28.4-r0.trigger
OK: 166 MiB in 29 packages
Removing intermediate container de3ce0298c84
 ---> 18f445c57f9e
Step 9/20 : RUN apk add --no-cache git libseccomp-dev make
 ---> Running in febaa5549bd2
fetch http://dl-cdn.alpinelinux.org/alpine/v3.8/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.8/community/x86_64/APKINDEX.tar.gz
(1/9) Installing nghttp2-libs (1.32.0-r0)
(2/9) Installing libssh2 (1.8.0-r3)
(3/9) Installing libcurl (7.61.0-r0)
(4/9) Installing expat (2.2.5-r0)
(5/9) Installing pcre2 (10.31-r0)
(6/9) Installing git (2.18.0-r0)
(7/9) Installing libseccomp (2.3.3-r1)
(8/9) Installing libseccomp-dev (2.3.3-r1)
(9/9) Installing make (4.2.1-r2)
Executing busybox-1.28.4-r0.trigger
OK: 182 MiB in 38 packages
Removing intermediate container febaa5549bd2
 ---> 3878c9534101
Step 10/20 : FROM gobuild-base AS buildkit-base
 ---> 3878c9534101
Step 11/20 : WORKDIR /go/src/github.com/moby/buildkit
Removing intermediate container 02b9b0a719a9
 ---> 23ea9852f91c
Step 12/20 : COPY . .
 ---> ee7bfc42ac16
Step 13/20 : RUN mkdir .tmp;   PKG=github.com/moby/buildkit VERSION=$(git describe --match 'v[0-9]*' --dirty='.m' --always) REVISION=$(git rev-parse HEAD)$(if ! git diff --no-ext-diff --quiet --exit-code; then echo .m; fi);   echo "-X ${PKG}/version.Version=${VERSION} -X ${PKG}/version.Revision=${REVISION} -X ${PKG}/version.Package=${PKG}" | tee .tmp/ldflags
 ---> Running in 9e87f7f593f8
-X github.com/moby/buildkit/version.Version=71e3c24 -X github.com/moby/buildkit/version.Revision=71e3c24df1be3c71ae8fef032bc705ec0428c9e1 -X github.com/moby/buildkit/version.Package=github.com/moby/buildkit
Removing intermediate container 9e87f7f593f8
 ---> 567a15d6a4c1
Step 14/20 : FROM buildkit-base AS buildctl
 ---> 567a15d6a4c1
Step 15/20 : ENV CGO_ENABLED=0
 ---> Running in b8cd231bfac7
Removing intermediate container b8cd231bfac7
 ---> 8064074395d8
Step 16/20 : ARG GOOS=linux
 ---> Running in af1218e24e2a
Removing intermediate container af1218e24e2a
 ---> afed94be7d7e
Step 17/20 : RUN go build -ldflags "$(cat .tmp/ldflags) -d" -o /usr/bin/buildctl ./cmd/buildctl
 ---> Running in 2517d0549ce2
Removing intermediate container 2517d0549ce2
 ---> c77c425050b8
Step 18/20 : FROM buildkit-base AS buildkitd
 ---> 567a15d6a4c1
Step 19/20 : ENV CGO_ENABLED=1
 ---> Running in 1dbd6524a618
Removing intermediate container 1dbd6524a618
 ---> ecd5783f78fd
Step 20/20 : RUN go build -installsuffix netgo -ldflags "$(cat .tmp/ldflags) -w -extldflags -static" -tags 'seccomp netgo cgo static_build' -o /usr/bin/buildkitd ./cmd/buildkitd
 ---> Running in a265d10ef1a0
Removing intermediate container a265d10ef1a0
 ---> cefdbf3097cd
Successfully built cefdbf3097cd
Successfully tagged buildkit:buildkitd
( containerID=$(docker create buildkit:buildkitd noop); \
        docker cp $containerID:/usr/bin/buildkitd bin/buildkitd; \
        docker rm $containerID )
a2a2009d1236d4ff1012e9abb9f609b7d973cb30afce7ec77453dedc7201034e
chmod +x bin/buildkitd
mkdir -p bin
docker build -t buildkit:buildctl --target buildctl -f ./hack/dockerfiles/test.Dockerfile --force-rm .
Sending build context to Docker daemon  24.99MB
Step 1/17 : ARG RUNC_VERSION=dd56ece8236d6d9e5bed4ea0c31fe53c7b873ff4
Step 2/17 : ARG CONTAINERD_VERSION=v1.1.0
Step 3/17 : ARG CONTAINERD10_VERSION=v1.0.3
Step 4/17 : ARG BUILDKIT_TARGET=buildkitd
Step 5/17 : ARG REGISTRY_VERSION=2.6
Step 6/17 : ARG ROOTLESSKIT_VERSION=20b0fc24b305b031a61ef1a1ca456aadafaf5e77
Step 7/17 : FROM golang:1.10-alpine AS gobuild-base
 ---> 34d3217973fd
Step 8/17 : RUN apk add --no-cache g++ linux-headers
 ---> Using cache
 ---> 18f445c57f9e
Step 9/17 : RUN apk add --no-cache git libseccomp-dev make
 ---> Using cache
 ---> 3878c9534101
Step 10/17 : FROM gobuild-base AS buildkit-base
 ---> 3878c9534101
Step 11/17 : WORKDIR /go/src/github.com/moby/buildkit
 ---> Using cache
 ---> 23ea9852f91c
Step 12/17 : COPY . .
 ---> Using cache
 ---> ee7bfc42ac16
Step 13/17 : RUN mkdir .tmp;   PKG=github.com/moby/buildkit VERSION=$(git describe --match 'v[0-9]*' --dirty='.m' --always) REVISION=$(git rev-parse HEAD)$(if ! git diff --no-ext-diff --quiet --exit-code; then echo .m; fi);   echo "-X ${PKG}/version.Version=${VERSION} -X ${PKG}/version.Revision=${REVISION} -X ${PKG}/version.Package=${PKG}" | tee .tmp/ldflags
 ---> Using cache
 ---> 567a15d6a4c1
Step 14/17 : FROM buildkit-base AS buildctl
 ---> 567a15d6a4c1
Step 15/17 : ENV CGO_ENABLED=0
 ---> Using cache
 ---> 8064074395d8
Step 16/17 : ARG GOOS=linux
 ---> Using cache
 ---> afed94be7d7e
Step 17/17 : RUN go build -ldflags "$(cat .tmp/ldflags) -d" -o /usr/bin/buildctl ./cmd/buildctl
 ---> Using cache
 ---> c77c425050b8
Successfully built c77c425050b8
Successfully tagged buildkit:buildctl
( containerID=$(docker create buildkit:buildctl noop); \
        docker cp $containerID:/usr/bin/buildctl bin/buildctl; \
        docker rm $containerID )
b3b673bc770e7d7a4d4d521ae8d7aa29fb7ab4d54bbd718ace078ae566a5e2c0
chmod +x bin/buildctl
```

```console
$ sudo make install
mkdir -p /usr/local/bin
install bin/buildkitd bin/buildctl /usr/local/bin
```
