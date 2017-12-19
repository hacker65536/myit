https://cr.yp.to/daemontools/install.html

```
yum install -y patch gcc
```

```
mkdir -p /package
chmod 1755 /package
cd /package
```

```
curl -SsL -O https://cr.yp.to/daemontools/daemontools-0.76.tar.gz
tar zxvf !$:t
cd admin/daemontools-0.76/
#curl -SsL -O http://qmail.org/moni.csi.hu/pub/glibc-2.3.1/daemontools-0.76.errno.patch
#patch -s -p1 <./daemontools-0.76.errno.patch
echo gcc -O2 -include /usr/include/errno.h > src/conf-cc
./package/install
```
