
`~/.zshrc`

```zsh
# history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=300000
HISTSIZE=200000

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
# setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS

# setopt HIST_NO_STORE
```



https://unix.stackexchange.com/questions/568907/why-do-i-lose-my-zsh-history
