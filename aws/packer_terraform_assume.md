pkginstall
----------

```
sudo yum -y update 
sudo yum -y install git jq
curl -s -O  https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
tar zxvf !$:t
rm !$
```
```
cat <<'EOF' >> ~/.bashrc
export GOROOT=$HOME/go
export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH:$GOROOT/bin
EOF

. ~/.bashrc
```


aws-cli
----------
```
sudo yum -y remove aws-cli
sudo pip install -U awscli
```

```
cat <<'EOF' >> ~/.bashrc
complete -C aws_completer aws
EOF
. ~/.bashrc
```


```
go get github.com/hashicorp/terraform
```

```
go get github.com/mitchellh/packer
```
