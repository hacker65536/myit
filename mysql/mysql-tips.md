
mysql8に対してmysql(mariadb)5系のclientで接続したときにエラーがでる
--
```
ERROR 2059 (HY000): Authentication plugin 'caching_sha2_password' cannot be loaded: /usr/lib64/mysql/plugin/caching_sha2_password.so: cannot open shared object file: No such file or directory
```





Can't connect to local MySQL server through socket 
--
```console
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                              NAMES
ad86a56c117e        mysql:5.7           "docker-entrypoint.s…"   4 minutes ago       Up 4 minutes        0.0.0.0:3306->3306/tcp, 0.0.0.0:33060->33060/tcp   mysql57
```

```console
mysql -h localhost -u root -p
Enter password:
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' (2)
```

`Mysql localhost != 127.0.0.1?`

https://stackoverflow.com/questions/19712307/mysql-localhost-127-0-0-1
