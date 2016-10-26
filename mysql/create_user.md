
show user list

```mysql
select user, host from mysql.user;
```


create user
```sql
CREATE USER 'DBUSER'@'localhost' IDENTIFIED BY  'DBPASS';
```
作成直後はUSAGE権限が付与されている(ハズ)
```sql
-- GRANT USAGE ON * . * TO  'DBUSER'@'localhost' IDENTIFIED BY  'DBPASS'
```

```sql
CREATE DATABASE IF NOT EXISTS  `DBNAME` ;
GRANT ALL PRIVILEGES ON  `DBNAME` . * TO  'DBUSER'@'localhost';


FLUSH PRIVILEGES;
```


```sql
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.175.157' WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;
```


権限の確認

```mysql
show grants for 'ユーザー名'@'ホスト名'
```


```

削除
```sql
revoke all PRIVILEGES on *.*  FROM user [, user] ...
```

ユーザ削除
```sql
delete from mysql.user where user='user' and host='';
```

ユーザ削除する場合は先にrevokeをしないとだめ、順番間違えると同名のユーザ権限を新規作成できない。
その場合は
```sql
drop user 'user'@'host';
```
を実行すべし




パスワード変更

```sql
SET PASSWORD FOR user@'192.168.175.0/255.255.255.0'=PASSWORD('password');
```


SSL

SSLrequire
```sql
GRANT USAGE ON *.* TO 'encrypted_user'@'%' REQUIRE SSL;
```
解除
```sql
GRANT USAGE ON *.* TO 'encrypted_user'@'%' REQUIRE NONE;
```
