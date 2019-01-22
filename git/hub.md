
install
------------
[hub install](https://github.com/github/hub#installation)

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
