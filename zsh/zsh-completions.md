# zsh-completions

https://github.com/zsh-users/zsh-completions


install
--

oh-my-zsh
```console
$ git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```

`~/.zshrc`

```console
  plugins=(… zsh-completions)
  autoload -U compinit && compinit
```
