


```
sudo yum install -y zlib-devel autoconf
```
```
hub clone https://github.com/git/git
cd git
git checkout v2.23.0
```

```
make configure
./configure --prefix=/usr
make all
sudo make install
```

```
git --version
git version 2.23.0
```
