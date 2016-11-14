#node.js

version v0.10.36  
##env
```bash
uname -a
Linux ip-xxx-xx-xx-xx 3.14.27-25.47.amzn1.x86_64 #1 SMP Wed Dec 17 18:36:15 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```

##require
```bash
yum install gcc gcc-c++

```

##install

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


#nvm

```bash
git clone https://github.com/creationix/nvm
./nvm/install.sh

. ~/.bashrc

nvm install v6.9
nvm use 6.9
```

