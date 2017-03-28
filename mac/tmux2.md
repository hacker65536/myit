
.tmux.conf(for mac)
```
unbind C-z
set -g prefix C-z
unbind C-b

# mouse scroll
set-window-option -g mouse on
set -g terminal-overrides 'xterm*:smcup@:rmcup@'


bind r source-file ~/.tmux.conf \; display "Reloaded!"
bind C-z send-prefix

setw -g mode-keys vi
set-option -g default-command "reattach-to-user-namespace -l $SHELL"
bind-key v copy-mode \; display "Copy mode!"

bind-key -t vi-copy v begin-selection
bind-key -t vi-copy v copy-pipe "reattach-to-user-namespace pbcopy"

unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

bind-key p paste-buffer
set-option -g default-terminal screen-256color
set -g terminal-overrides 'xterm:colors=256'


run-shell "powerline-daemon -q"
source "/usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
```


.tmux.conf(linux)

```
unbind C-z
set -g prefix C-z
unbind C-b
bind C-z send-prefix
setw -g mode-keys vi
```


