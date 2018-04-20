```
yum install https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
yum install mysql
```
```
mysql --version
mysql  Ver 8.0.11 for Linux on x86_64 (MySQL Community Server - GPL)
```

```
docker run --rm -d --name mysql8  -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306  mysql:8
```

```
mysql_config_editor set --login-path=local --host=127.0.0.1 --user=root --password
```e
