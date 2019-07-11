
```console
$ sudo yum list installed tmux
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
619 packages excluded due to repository priority protections
Installed Packages
tmux.x86_64                                1.8-4.amzn2.0.1                                @amzn2-core
```

```console
$ sudo yum remove tmux
```

```console
$ sudo yum install libevent-devel ncurses-devel byacc
```


```console
$ cd 
$ git clone https://github.com/tmux/tmux.git
$ git checkout 3.0
```

```console
$ sudo yum install libevent-devel ncurses-devel
```

```console
$ ./autogen.sh
$ ./configure
$ make && sudo make install
```

```console
$ tmux -V
tmux 3.0-rc3
```

