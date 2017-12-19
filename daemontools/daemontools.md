https://cr.yp.to/daemontools/install.html

```
yum install -y patch gcc
```

```bash
mkdir -p /package
chmod 1755 /package
cd /package
```

```bash
curl -SsL -O https://cr.yp.to/daemontools/daemontools-0.76.tar.gz
tar zxvf !$:t
```

patch error.sh
```bash
cd admin/daemontools-0.76/
#curl -SsL -O http://qmail.org/moni.csi.hu/pub/glibc-2.3.1/daemontools-0.76.errno.patch
#patch -s -p1 <./daemontools-0.76.errno.patch
echo gcc -O2 -include /usr/include/errno.h > src/conf-cc
```

install
```
./package/install
```


centos6
```
cat <<'EOF' > /etc/init/svscan.conf
start on runlevel [12345]
respawn
exec /command/svscanboot
EOF
```


centos7(systemd)
```
cat <<'EOF' > /etc/systemd/system/daemontools.service 
[Unit]
Description=daemontools Start supervise
After=getty.target

[Service]
Type=simple
User=root
Group=root
Restart=always
ExecStart=/command/svscanboot /dev/ttyS0
TimeoutSec=0

[Install]
WantedBy=multi-user.target
EOF
```
