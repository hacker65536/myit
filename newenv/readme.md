
# amazon linux 2

install git 
```
$ sudo yum install -y git
```

set dir_colors
```
$ git clone  https://github.com/seebi/dircolors-solarized
$ cp !$:t/dircolors.256dark ~/.dir_colors
$ echo "export TERM=xterm-256color" >> ~/.bashrc
$ bash -l
```
[ref](terminal/dir_colors.md)


set golang env
```console
$ sudo rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
$ curl -s https://mirror.go-repo.io/centos/go-repo.repo | sudo tee /etc/yum.repos.d/go-repo.repo
$ sudo sed -e 's/\$releasever/7/' -i /etc/yum.repos.d/go-repo.repo  #amzlinu2
$ sudo yum install gcc 
$ sudo yum install golang --disablerepo=amzn2-core,amzn2extra-golang1.9 --enablerepo=go-repo
$ mkdir -p ~/go/{bin,pkg,src}
$ echo 'export GOPATH="$HOME/go"' >> ~/.bashrc
$ echo 'export PATH="$PATH:${GOPATH//://bin:}/bin"' >> ~/.bashrc
```

set tmux
```console
$ sudo yum install ncurses-devel libevent-devel
$ curl -LSsO https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
$ tar zxvf !$:t
$ cd !$:r:r
$ ./configure
$ make
$ sudo make install
$ cd ..
$ rm -rf tmux-2.7*
```
```console
$ cat <<'EOF' > ~/.tmux.conf
unbind C-z
set -g prefix C-z
unbind C-b
bind C-z send-prefix

set -g mouse on
set-option -s set-clipboard off

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
EOF
```
