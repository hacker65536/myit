# vi mode

https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode


```zsh
plugins=(
vi-mode
)
```


ecs -> normal mode
i or a switch to insert mode


confilict with zsh-autosuggestion

https://github.com/zsh-users/zsh-autosuggestions/issues/472


```
$ ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(end-of-line)
$ bindkey -M viins '^E' end-of-line
```

or 

```zsh
bindkey '^F' forward-char
```
or both
