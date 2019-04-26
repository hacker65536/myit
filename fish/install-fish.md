https://fishshell.com/

https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish
```console
$ cd /etc/yum.repos.d/
$ sudo curl -SsL -O https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
$ sudo yum install -y fish
```

```console
$ sudo yum list installed "fish*"
Loaded plugins: langpacks, priorities, update-motd
Installed Packages
fish.x86_64                                2.7.1-1.1                                 @shells_fish_release_2
```

```console
# linux
$ fish
```

```console
# mac
$ chsh -s /usr/bin/fish
```


release3
--

```
$ cd /etc/yum.repos.d/
$ wget https://download.opensuse.org/repositories/shells:fish:release:3/RHEL_7/shells:fish:release:3.repo
$ yum install fish
```
