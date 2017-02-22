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
region=us-west-2 # notice

aws configure set aws_access_key_id $key
aws configure set aws_secret_access_key $secret
aws configure set region $region
```

profile for assume
```
profile=anotheraws
role_arn=arn:aws:iam::99999999999:role/crossAccount
region=us-east-2  # notice

aws configure --profile $profile set role_arn $role_arn
!:0-4 region $region
!:0-4 source_profile default
```


operation with assume role
---------

explicitly
```
aws ec2 describe-vpcs --profile $profile
```

env 
```
export AWS_PROFILE=$profile
aws ec2 describe-vpcs
```

alias
```
alias aws="aws --profile $profile"
```
