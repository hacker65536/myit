
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
