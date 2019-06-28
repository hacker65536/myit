redis cli
==
https://redis.io/topics/rediscli


docker version
--

```console
$ docker run --rm --name redis -d redis:latest
```
```console
$ docker exec -it redis bash
```


ping pong
--

```console
# redis-cli
127.0.0.1:6379> ping
PONG
```


enable auth(password)
--

```console
$ docker run -d --rm --name redis redis --requirepass "mypass"
```
```console
$ docker exec -it redis redis-cli -a mypass ping
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
PONG
```

set value test
--


```console
$ docker exec -it redis bash
root@2066f9b46763:/data# redis-cli -a mypass
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379> set foo 100
OK
127.0.0.1:6379> incr foo
(integer) 101
127.0.0.1:6379> append foo xxx
(integer) 6
127.0.0.1:6379> get foo
"101xxx"
```

```console
root@2066f9b46763:/data# redis-cli -a mypass set foo 100
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
OK
root@2066f9b46763:/data# redis-cli -a mypass -r 5 incr foo
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
(integer) 101
(integer) 102
(integer) 103
(integer) 104
(integer) 105
```
