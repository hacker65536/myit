

#install jq

##set timezone
```bash
cp /etc/localtime /etc/localtime.org
\cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
```

##yum update

```bash
yum update -y
```

##require

latest version(2015/02/22) require bison 3.x ,but amzlinux have 2.4.1
dont use bison or update bison 3.x from source ,or use previous version `3e1baf59167d6e7d836ec39d353eec1022331a6d`

```bash
yum install -y gcc flex bison autoconf automake libtool
```
