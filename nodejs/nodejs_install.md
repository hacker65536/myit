# node.js

https://nodejs.org/en/download/package-manager/

Latest LTS Version: 10.16.0 (includes npm 6.9.0)


## require
```bash
yum install gcc gcc-c++

```

## install

### from source

```console
$ wget "https://nodejs.org/dist/v10.16.0/node-v10.16.0.tar.gz"
$ tar zxvf node-v10.16.0.tar.gz
$ cd node-v10.16.0
$ ./configure
$ make
$ sudo make install
```


### from yum

```bash
yum install --enablerepo=epel nodejs
```


### from nvm(recommend)

```console
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```
```console
$ tail -n 3 ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

```console
$ source ~/.bashrc
```

```console
$ nvm install --latest-npm --lts
Installing latest LTS version.
Downloading and installing node v10.16.0...
Downloading https://nodejs.org/dist/v10.16.0/node-v10.16.0-linux-x64.tar.xz...
############################################################################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v10.16.0 (npm v6.9.0)
Creating default alias: default -> lts/* (-> v10.16.0)
Attempting to upgrade to the latest working version of npm...
* Installing latest `npm`; if this does not work on your node version, please report a bug!
/home/ec2-user/.nvm/versions/node/v10.16.0/bin/npm -> /home/ec2-user/.nvm/versions/node/v10.16.0/lib/node_modules/npm/bin/npm-cli.js
/home/ec2-user/.nvm/versions/node/v10.16.0/bin/npx -> /home/ec2-user/.nvm/versions/node/v10.16.0/lib/node_modules/npm/bin/npx-cli.js
+ npm@6.10.1
added 19 packages from 13 contributors, removed 12 packages and updated 32 packages in 4.266s
* npm upgraded to: v6.10.1
```

```console
$ nvm ls
->     v10.16.0
default -> lts/* (-> v10.16.0)
node -> stable (-> v10.16.0) (default)
stable -> 10.16 (-> v10.16.0) (default)
iojs -> N/A (default)
unstable -> N/A (default)
lts/* -> lts/dubnium (-> v10.16.0)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.17.1 (-> N/A)
lts/carbon -> v8.16.0 (-> N/A)
lts/dubnium -> v10.16.0
```

```console
$ node -v
v10.16.0
```
### from nodebrew
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

### from anyenv

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

```
ndenv global v9.5.0
```

```
$ node -v
v9.5.0
```
