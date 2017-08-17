

# install jq

## environment

```bash
uname -a
Linux ip-10-0-0-232 3.14.27-25.47.amzn1.x86_64 #1 SMP Wed Dec 17 18:36:15 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```
## set timezone
```bash
cp /etc/localtime /etc/localtime.org
\cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
```

## yum update

```bash
yum update -y
```

## require

latest version(2015/02/22) require bison 3.x ,but amzlinux have 2.4.1
dont use bison or update bison 3.x from source ,or use previous version `3e1baf59167d6e7d836ec39d353eec1022331a6d`

```bash
yum install -y git gcc autoconf automake libtool
```
optional  
```bash
yum install -y flex bison oniguruma-devel valgrind
```

### previous version

```bash
yum install -y oniguruma-devel
cd /usr/local/src
git clone https://github.com/stedolan/jq.git
cd jq
git checkout  3e1baf59167d6e7d836ec39d353eec1022331a6d
autoreconf -i
./configure
make
make install
```

### latest version(2015/02/22)
```bash
yum remove bison
cd /usr/local/src/
wget "http://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.gz"
tar zxvf bison-3.0.4.tar.gz
cd bison-3.0.4
./configure
make
make install
```
add to ld.so.conf  
```bash
echo "/usr/local/lib" >>  /etc/ld.so.conf.d/local.conf
ldconfig
ldconfig -p
```

```bash
cd /usr/local/src
git clone https://github.com/stedolan/jq.git
cd jq
autoreconf -i
./configure
make
make install
```

if you have this message  
```
Install missing gems with `bundle install`
*****************************************************************
*  Ruby dependencies for building jq documentation not found.   *
*  You can still build, install and hack on jq, but the manpage *
*  will not be rebuilt and some of the tests won't run.         *
*  See docs/README.md for how to install the docs dependencies. *
*****************************************************************
no
```

the command below to resolve this problem  
```bash
cd docs/
bundle install
```
