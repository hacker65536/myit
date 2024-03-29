
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
set -g mode-mouse on
set -g mouse-resize-pane on
```


prefix default = C-b

>tmux may be controlled from an attached client by using a key combination of a prefix key,
     ‘C-b’ (Ctrl-b) by default, followed by a command key.



https://gist.github.com/MohamedAlaa/2961058

window

- c create a new window
- w choose the current window interactively
- & Kill the current window
- n Change to the next window
- p Change to the previous window
- l Move to the previously selected window
- ' Prompt for a window index to select.
- . Prompt for an index to move the current window.
- , Rename the current window
- f Prompt to search for text in open windows

pane

- % vertical split
- " horizontal split
- o swap panes
- q show pane numbers
- x kill pane
- + break pane into window
- - restore pane from window

```
PREFIX : resize-pane -D (Resizes the current pane down)
PREFIX : resize-pane -U (Resizes the current pane upward)
PREFIX : resize-pane -L (Resizes the current pane left)
PREFIX : resize-pane -R (Resizes the current pane right)
PREFIX : resize-pane -D 20 (Resizes the current pane down by 20 cells)
PREFIX : resize-pane -U 20 (Resizes the current pane upward by 20 cells)
PREFIX : resize-pane -L 20 (Resizes the current pane left by 20 cells)
PREFIX : resize-pane -R 20 (Resizes the current pane right by 20 cells)
PREFIX : resize-pane -t 2 20 (Resizes the pane with the id of 2 down by 20 cells)
PREFIX : resize-pane -t -L 20 (Resizes the pane with the id of 2 left by 20 cells)
```


join-pane
```
:join-pane -t : dst-pane
:join-pane -s : src-pane
```


## 2.7 install
https://github.com/tmux/tmux/wiki  

https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
```console 
$ uname -r
4.14.62-70.117.amzn2.x86_64
```
require
```console
$ sudo yum install ncurses-devel libevent-devel
```
install
```console
$ curl -LSsO https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
$ tar zxvf !$:t
$ cd !$:r:r
$ ./configure
$ make
$ sudo make install
```


paste with mouse
 
https://unix.stackexchange.com/questions/318281/how-to-copy-and-paste-with-a-mouse-with-tmux

```
set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M
bind -n C-WheelUpPane select-pane -t= \; copy-mode -e \; send-keys -M
bind -T copy-mode-vi    C-WheelUpPane   send-keys -X halfpage-up
bind -T copy-mode-vi    C-WheelDownPane send-keys -X halfpage-down
bind -T copy-mode-emacs C-WheelUpPane   send-keys -X halfpage-up
bind -T copy-mode-emacs C-WheelDownPane send-keys -X halfpage-down

# To copy, left click and drag to highlight text in yellow, 
# once you release left click yellow text will disappear and will automatically be available in clibboard
# # Use vim keybindings in copy mode
setw -g mode-keys vi
# Update default binding of `Enter` to also use copy-pipe
unbind -T copy-mode-vi Enter
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -selection c"
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
```
