
install
------------
[hub install](https://github.com/github/hub#installation)


form source
```console
$ mkdir -p "$GOPATH"/src/github.com/github
$ git clone \
  --config transfer.fsckobjects=false \
  --config receive.fsckobjects=false \
  --config fetch.fsckobjects=false \
  https://github.com/github/hub.git "$GOPATH"/src/github.com/github/hub
$ cd "$GOPATH"/src/github.com/github/hub
$ make install prefix=/usr/local
```

download binary
```console
$ curl -SsLO https://github.com/github/hub/releases/download/v2.7.1/hub-linux-amd64-2.7.1.tgz
$ tar zxvf !$:t
$ cd !$:r
$ sudo prefix=/usr/local ./install
$ whereis hub
hub: /usr/local/bin/hub
```
```
echo 'eval "$(hub alias -s)"' >> ~/.bashrc
```

```
hub clone rails/rails

# expands to:
git clone https://github.com/rails/rails.git

```

pullreq

```
git pull-request -m "comment" -b repo:master [-h myfork:feature]
```
