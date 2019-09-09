

common
--
- git
- gcc
- golang
- jq



```console
$ sudo yum install -y git gcc
```


vim 8.1+ with python3 ([here](/vim/vim8-from-source.md))

```console
$ git clone https://github.com/vim/vim.git
$ cd vim
$ ./configure --enable-python3interp
$ make
$ sudo make install
```


jq 1.6+ ([here](/jq/install_jq.md))
```console
$ sudo curl -SsL -o jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
$ sudo chmod +x jq 
$ sudo mv jq /usr/local/bin/jq
```


golang ([here](/golang/golang-install.md))
```console
$ sudo rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
$ curl -s https://mirror.go-repo.io/centos/go-repo.repo | sudo tee /etc/yum.repos.d/go-repo.repo
$ sudo sed -e 's/\$releasever/7/' -i /etc/yum.repos.d/go-repo.repo  #amzlinu2
$ sudo yum install gcc # before install golang 1.11 from outside of amzn2-core
$ sudo yum install golang --disablerepo=amzn2-core,amzn2extra-golang1.9 --enablerepo=go-repo
```


sh
--
- fish


fish([here](/fish/install-fish.md))
```console
$ cd /etc/yum.repos.d/
$ sudo wget https://download.opensuse.org/repositories/shells:fish:release:3/RHEL_7/shells:fish:release:3.repo
$ sudo yum install fish
```

```
$ curl -L https://get.oh-my.fish | fish
```
```
$ omf install bobthefish
```


aws
--
- aws-sam-cli
- awscli


```console
$ pip install --user -U awscli
```

```console
$ pip install --user aws-sam-cli
```


vim
--
- vim-golang
- pathogen


pathogen
```
$ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
 curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```



```console
$ git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
```





node
--


```console
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```
```console
$ . ~/.bashrc
```

```console
$ nvm install --lts
```

```console
$ npm i -g aws-cdk
```

pip
--

- ansible



go pkg
--

hub

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

```
$ cd /usr/local/bin/
$ sudo curl -SsLO https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh
$ sudo chmod 755 !$:t
```

```
$ echo '# HUB' >> ~/.bashrc
```
```
$ echo 'eval "$(hub alias -s)"' >> ~/.bashrc
```
```
$ cat <<EOF >> ~/.bashrc
if [ -f $(which hub).bash_completion.sh ]; then
  . $(which hub).bash_completion.sh
fi
EOF
```
