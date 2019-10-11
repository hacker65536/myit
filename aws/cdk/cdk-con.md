

OS

amzlinux2

development environment
--

install jq 1.6
```
sudo curl -SsL -o jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
sudo chmod +x jq
sudo mv jq /usr/local/bin/jq
```


install golang
```
sudo rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
curl -s https://mirror.go-repo.io/centos/go-repo.repo | sudo tee /etc/yum.repos.d/go-repo.repo
sudo sed -e 's/\$releasever/7/' -i /etc/yum.repos.d/go-repo.repo 
sudo yum install -y gcc
sudo yum install -y golang --disablerepo=amzn2-core,amzn2extra-golang1.9 --enablerepo=go-repo
```

install git 2.23
```
sudo yum install -y git zlib-devel autoconf 
```
```
git clone -b v2.23.0 https://github.com/git/git
cd git
```
```
make configure
./configure --prefix=/usr
make all
sudo make install
```


docker environment
--

Independent docker that is new version 

```
sudo amazon-linux-extras install -y docker
```
```
sudo usermod -a -G docker $(whoami)
newgrp docker
```

for building docker enging with DinD
```
cat <<'EOF' | sudo tee /etc/docker/daemon.json
{
    "experimental": true
}
EOF
```

```
sudo systemctl start docker
```

```
sudo yum install -y device-mapper-devel
```

```
git clone -b v19.03.3 https://github.com/docker/engine.git
cd engine
```


`[+] Building 162.6s (67/67) FINISHED`
```
make
```

```
sudo GOPATH=$(go env GOPATH) make install
```

```
sudo systemctl stop docker
```


for root to excute command in /usr/local/bin
```
sudo sed -r -e 's|^(Defaults\s+secure_path.*)|\1:/usr/local/bin|' -i /etc/sudoers
```

run service of docker
```
nohup sudo /usr/local/bin/dockerd -D > /dev/null &
```



install docker cli

```
git clone -b v19.03.3  https://github.com/docker/cli.git
cd cli
```
```
make -f docker.Makefile binary
sudo mv build/docker* /usr/local/bin/
```

```
echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bashrc
source  ~/.bashrc
```

```
mkdir -p ~/.docker/cli-plugins/
mkdir -p testdir && cd testdir
```
```
export DOCKER_BUILDKIT=1
```
```
docker build --platform=local -o . git://github.com/docker/buildx
mv buildx ~/.docker/cli-plugins/docker-buildx
```

```
cat /etc/docker/daemon.json | jq '.|= .+{"features":{"buildkit":true}}'| sudo tee /etc/docker/daemon.json
```

```json
{
  "experimental": true,
  "features": {
    "buildkit": true
  }
}
```

```
sudo kill $(pgrep dockerd)
```

```
nohup sudo /usr/local/bin/dockerd -D > /dev/null &
```


editor environemnt
--


- vim

- for vscode

- syntax


javascript  environment
--
- nvm
- node
- typescript
-

aws environment
--

install and configure awscli

```
sudo yum install -y python3
```
```
pip3 install --user awscli
```
```
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

```
aws configure set aws_access_key_id xxxxxx
aws configure set aws_secret_access_key yyyyy
aws configure set cli_follow_urlparam false
```


`myprofile=myprofile`
`myses=mysessionname`
```
aws configure --profile $myprof set role_arn arn:aws:iam::000000000000:role/assumegroup
aws configure --profile $myprof set source_profile  default
aws configure --profile $myprof set role_session_name  $myses
```
```
echo "export AWS_DEFAULT_PROFILE=$myprof" >> ~/.bashrc
```
```
source ~/.bashrc
```

check your iam
```
aws sts get-caller-identity
```


completion for fish
```
omf install aws
```
Or attach a IAM role that can operate as a administrator.


