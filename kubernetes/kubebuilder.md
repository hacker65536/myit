# kubebuilder tutorial

https://zoetrope.github.io/kubebuilder-training/introduction/installation.html



## prerequisite

amazonlinux:2

### install golang
```
sudo rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
curl -s https://mirror.go-repo.io/centos/go-repo.repo | sudo tee /etc/yum.repos.d/go-repo.repo
sudo sed -e 's/\$releasever/7/' -i /etc/yum.repos.d/go-repo.repo  #amzlinu2
sudo yum install -y  gcc # before install golang 1.11 from outside of amzn2-core
sudo yum install -y golang --disablerepo=amzn2-core,amzn2extra-golang1.9 --enablerepo=go-repo
```

```console
# go version
go version go1.19.1 linux/amd64
```

### install docker 
```
sudo amazon-linux-extras install docker
sudo usermod -a -G docker ec2-user
sudo systemctl start docker
```

```
bash -l
```

```
sudo docker version
```
