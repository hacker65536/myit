
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
$ export GO111MODULE=on 
$ sudo make install prefix=/usr/local
```

got an error if without `export GO111MODULE=on`
```
$ sudo make install prefix=/usr/local
script/build -o bin/hub
build flag -mod=vendor only valid when using modules
make: *** [bin/hub] Error 1
```



download binary
```console
$ curl -SsL https://github.com/github/hub/releases/download/v2.12.8/hub-linux-amd64-2.12.8.tgz | tar zxvf -
$ cd hub-linux-amd64-2.12.8/
$ sudo prefix=/usr/local ./install
$ whereis hub
hub: /usr/local/bin/hub
```


configuration
------
alias
```console
$ echo 'eval "$(hub alias -s)"' >> ~/.bashrc
```
tab-completion(bash)  
https://github.com/github/hub/tree/master/etc
```console
$ cat <<EOF >> ~/.bashrc
if [ -f $(which hub).bash_completion.sh ]; then
  . $(which hub).bash_completion.sh
fi
EOF
```

```console
$ cd /usr/local/bin/
$ sudo curl -SsLO https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh
$ sudo chmod 755 !$:t
```

```console
$ source ~/.bashrc
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
