

forget root password
--

mysql5.7

https://dev.mysql.com/doc/refman/5.7/en/resetting-permissions.html

```console
$ cat <<'EOF' > pass-init
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
EOF
```

```console
$ systemctl stop mysqld
```

```console
$ sudo -u mysql /usr/sbin/mysqld --init-file=/home/me/mysql-init 
```







### skip password
edit my.cnf
```
[mysqld]
skip-grant-tables
```

```console
$ systemctl restart mysqld
$ mysql -u root 
```
cant change
```
mysql> set password = 'PASSWORD';
The MySQL server is running with the --skip-grant-tables option so it cannot execute this statement
```
