# asdf

Manage multiple runtime versions with a single CLI tool

https://asdf-vm.com/


## download
```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf 
```

## ohmyzsh


https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf


```
plugins=(asdf)
```


### example for eksctl

https://github.com/elementalvoid/asdf-eksctl

```
asdf plugin-add eksctl https://github.com/elementalvoid/asdf-eksctl.git
```

```console 
$ asdf install eksctl latest
Downloading eksctl from https://github.com/weaveworks/eksctl/releases/download/v0.70.0/eksctl_Linux_amd64.tar.gz
```

```console
$ asdf global eksctl latest
```

```console
$ whereis eksctl
eksctl: /home/ec2-user/.asdf/shims/eksctl
```


```console
$ eksctl version
0.70.0
```

```console
$ asdf plugin update eksctl
Updating eksctl to master
Already on 'master'
Your branch is up to date with 'origin/master'.
```
```console
$ asdf install eksctl latest
eksctl 0.122.0 is already installed
```
```console
$ asdf global eksctl latest
```

### list

```
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git 
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
```


### upgrade

```
rm -rf ~/.asdf/shims && asdf reshim
```
