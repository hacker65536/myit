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


set follow line to make `meta-.` behavior
```
bindkey '\e.' insert-last-word
```


# another zsh-vi-mode
https://github.com/jeffreytse/zsh-vi-mode
```
git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH/custom/plugins/zsh-vi-mode
```
```
plugins+=(zsh-vi-mode)
ZVM_CURSOR_STYLE_ENABLED=false
```



ref  
https://qiita.com/yuku_t/items/e58cbecf13407446bd50  
https://github.com/ohmyzsh/ohmyzsh/issues/497  


work fine 2022-12
```
  zsh-vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
```
