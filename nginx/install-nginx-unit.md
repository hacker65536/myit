
install nginx-unit
=============

Amazon linux 2
--------

```
# cat /etc/system-release
Amazon Linux release 2 (2017.12) LTS Release Candidate
```
create repo
```
cat <<'EOF'>/etc/yum.repos.d/unit.repo
[unit]
name=unit repo
baseurl=https://packages.nginx.org/unit/amzn2/$releasever/$basearch/
gpgcheck=0
enabled=1
EOF
```

install unit 
```
yum install -y unit
```

install additional module packages

```
yum install unit-php unit-python unit-go unit-perl
```

```
systemctl start unit
```
```
# ps aux|grep uni[t]
root      3562  0.0  0.1  20596  1268 ?        Ss   03:29   0:00 unit: main [/usr/sbin/unitd]
nobody    3564  0.0  0.0  20596   248 ?        S    03:29   0:00 unit: controller
nobody    3565  0.0  0.0  20596   252 ?        S    03:29   0:00 unit: router
```
```
# journalctl -u unit
-- Logs begin at Mon 2018-04-16 03:17:38 UTC, end at Mon 2018-04-16 03:30:01 UTC. --
Apr 16 03:29:56 ip-172-31-29-117.us-east-2.compute.internal systemd[1]: Starting NGINX Unit...
Apr 16 03:29:56 ip-172-31-29-117.us-east-2.compute.internal unitd[3561]: 2018/04/16 03:29:56 [info]
Apr 16 03:29:56 ip-172-31-29-117.us-east-2.compute.internal systemd[1]: Started NGINX Unit.
```
