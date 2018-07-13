
```
$ yum install https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
```

```
$ yum-config-manager --disable mysql80-community
```
```
$ yum-config-manager --enablerepo mysql56-community
```

if installed 
```
$ yum-config-manager --disable percona-release-x86_64
```

```
$ yum install mysql-server
```
