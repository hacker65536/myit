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


set auth(password)
--

```console
$ docker run -d --rm --name redis redis --requirepass "mypass"
```
```console
$ docker exec -it redis redis-cli -a mypass ping
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
PONG
```


