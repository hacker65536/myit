

```console
source <(kubectl completion zsh)
```

```console
$ echo 'alias k=kubectl' >>~/.zshrc
$ echo 'complete -F __start_kubectl k' >>~/.zshrc
```

if get an error, add the following to the beginning of `~/.zshrc`
```zsh
autoload -Uz compinit
compinit
```
