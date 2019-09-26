# fish

https://fishshell.com/


install
--
down load page

https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A3&package=fish


### release3

```console
$ sudo curl -Ssl -o /etc/yum.repos.d/shells:fish:release:3.repo https://download.opensuse.org/repositories/shells:fish:release:/3/RHEL_7/shells:fish:release:3.repo
$ sudo yum install fish
```

### release2
```console
$ cd /etc/yum.repos.d/
$ sudo curl -SsL -O https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
$ sudo yum install -y fish
```

### try
```console
# linux
$ fish
```

```console
# mac
$ chsh -s /usr/bin/fish
```


