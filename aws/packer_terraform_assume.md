pkginstall for env
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

go get terraform
------------
```
go get github.com/hashicorp/terraform
```

go get packer
------------
```
go get github.com/mitchellh/packer
```


set aws creds
------------

default 
```
key=XXXXXXXX
secret=XXXXXXXXXX

aws configure set aws_access_key_id $key
aws configure set aws_secret_access_key $secret
```

profile for assume
```
profile=anotheraws
region=us-west-2
role_arn=arn:aws:iam::99999999999:role/crossAccount

aws configure --profile $profile set role_arn $role_arn
aws configure --profile $profile set region $region
aws configure --profile $profile set source_profile default
```

