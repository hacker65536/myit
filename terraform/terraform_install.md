
#install

```
TERRAFORM_VERSION=0.9.3

curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip !$:t
mv terraform /usr/local/bin/
```


from source

```bash
sudo yum install -y git aws-cli jq
wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
tar zxvf go1.8.linux-amd64.tar.gz
cat <<'EOF' >> ~/.bashrc

export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH

EOF

. ~/.bashrc
go get github.com/hashicorp/terraform
```

```
$ terraform version
Terraform v0.9.1-dev
```

