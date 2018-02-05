# node.js

version v0.10.36  
## env
```bash
uname -a
Linux ip-xxx-xx-xx-xx 3.14.27-25.47.amzn1.x86_64 #1 SMP Wed Dec 17 18:36:15 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```

## require
```bash
yum install gcc gcc-c++

```

## install

```bash
wget "http://nodejs.org/dist/v0.10.36/node-v0.10.36.tar.gz"
tar zxvf node-v0.10.36.tar.gz
cd node-v0.10.36
./configure
make
make install
```

```bash
yum install --enablerepo=epel nodejs
```


# nvm

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

. ~/.bashrc

nvm ls-remote
nvm install v8.9.4
nvm use 8.9.4
```
# nodebrew
```bash
sudo yum install -y gcc gcc-c++
curl -L git.io/nodebrew | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bashrc
.  ~/.bashrc
nodebrew install v6.9.1
nodebrew use v6.9.1
node -v
```
check version from remote
```bash
nodebrew ls-remote
```

# anyenv

install anyenv
```
git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(anyenv init -)"' >> ~/.bashrc
exec $SHELL -l
```
```
anyenv install ndenv
exec $SHELL -l
```
```
$ anyenv version
ndenv: system (set by /home/ec2-user/.anyenv/envs/ndenv/version)
```
```
$ ndenv install -l
```
```
$ ndenv install v9.5.0
Downloading node-v9.5.0-linux-x64.tar.gz...
-> https://nodejs.org/dist/v9.5.0/node-v9.5.0-linux-x64.tar.gz
Installing node-v9.5.0-linux-x64...
Installed node-v9.5.0-linux-x64 to /home/ec2-user/.anyenv/envs/ndenv/versions/v9.5.0
```

