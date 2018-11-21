
https://gist.github.com/limingjie/4975c36d13d0927613e6  
https://stackoverflow.com/questions/15375992/vim-difference-between-t-co-256-and-term-xterm-256color-in-conjunction-with-tmu/15378816#15378816



- putty

`connection -> data -> terminal-type string`  => `xterm-256color`

- tmux 

```
set -g default-terminal "screen-256color"
```

- screen
```
term "screen-256color"
```

- bash
```
export TERM=xterm-256color
```

- vim
```vim
if &term == "screen"
  set t_Co=256
endif
```
https://github.com/segaleran/eran-dotfiles/blob/master/bin/terminalcolors.py
