
## bash completion
require bash-completion

```
sudo yum install -y --enablerepo=epel bash-completion
```


```
curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker > /etc/bash_completion.d/docker
```


## fish completion

```console
cd  ~/.config/fish/completion
wget https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish
```

