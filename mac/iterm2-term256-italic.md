

https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be



xterm-256color-italic.terminfo

```
xterm-256color-italic|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color,
```


tmux-256color.terminfo

```
tmux-256color|tmux with 256 colors,
  ritm=\E[23m, rmso=\E[27m, sitm=\E[3m, smso=\E[7m, Ms@,
  khome=\E[1~, kend=\E[4~,
  use=xterm-256color, use=screen-256color,
```


```console
$ tic -x xterm-256color-italic.terminfo
$ tic -x tmux-256color.terminfo
```


Preferences -> Profile -> Text -> Italic text (check)

Preferences -> Profile -> Terminal -> Report Terminal `xterm-256color-italic`



~/.tmux.conf
```
set -g default-terminal 'tmux-256color'
set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'
```


~/.vimrc
```
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
```


~/.bash_profile
```
eval $(TERM=xterm dircolors)
alias ls='ls --color=auto'
```
