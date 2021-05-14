# eksctl completion


bash
--

```console
. <(eksctl completion bash)
```

zsh
--

```console
$ mkdir -p ~/.zsh/completion/
$ eksctl completion zsh > ~/.zsh/completion/_eksctl
```

```zsh
fpath=($fpath ~/.zsh/completion)

autoload -U compinit
compinit
```

fish
--

```console
$ mkdir -p ~/.config/fish/completions
$ eksctl completion fish > ~/.config/fish/completions/eksctl.fish
```
