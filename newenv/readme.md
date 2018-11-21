

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
