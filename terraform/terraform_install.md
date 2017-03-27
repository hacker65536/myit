
#install

```
cd /usr/local/src
wget "https://releases.hashicorp.com/terraform/0.6.14/terraform_0.9.1_linux_amd64.zip"
mkdir -p terraform/bin
unzip -d terraform/bin terraform_0.9.1_linux_amd64.zip
mv /usr/local/src/terraform /usr/local/
```

set PATH ( ~/.bash_rc)
```
export PATH=/usr/local/terraform/bin:$PATH
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

