# docker completion (zsh)


```console
$ mkdir -p ~/.zsh/completion
```


```console
$ curl -o ~/.zsh/completion/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
```

```zsh
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
```



ohmyzsh

```zsh
plugins=(
   docker
)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
```
