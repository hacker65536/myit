
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
