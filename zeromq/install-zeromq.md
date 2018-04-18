
https://github.com/zeromq/libzmq

require
```
yum install -y libtool gcc-c++
```

```
git clone https://github.com/zeromq/libzmq.git
```

```
./autogen.sh && ./configure && make -j 4
make check && make install && sudo ldconfig
```

```
cat /etc/ld.so.conf.d/local.conf
/usr/local/lib
```
