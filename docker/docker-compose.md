install
------------
```bash
curl \
-L "https://github.com/docker/compose/releases/download/1.11.1/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
```

```
$ docker-compose version
docker-compose version 1.11.1, build 7c5d5e4
docker-py version: 2.0.2
CPython version: 2.7.13
OpenSSL version: OpenSSL 1.0.1t  3 May 2016
```



command
-----------------

* build
* bundle
* config
* create
* down
* events
* exec
* help
* kill
* logs
* pause
* port
* ps
* pull
* push
* restart
* rm
* run
* scale
* start
* stop
* top
* unpause
* up
* version



```
docker-compose up -d

docker-compose down
```


```
docker-compose build
docker-compose create
docker-compose start
```

```
docker-compose stop
docker-compose rm
```



individual case
--------------
[docker-compose-sample.yml](https://gist.githubusercontent.com/hacker65536/0141ae9e74d2712a5b7233efb870aaef/raw/587812a9a89e1f456619dac92156721b6a8f975b/docker-compose-sample.yml)

```
$ docker images
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
amazon/amazon-ecs-agent   latest              90be67243de1        4 weeks ago         8.276 MB
```


```
$ docker-compose pull
Pulling db (mysql:5.7)...
5.7: Pulling from library/mysql
5040bd298390: Pull complete
55370df68315: Pull complete
fad5195d69cc: Pull complete
a1034a5fbbfc: Pull complete
17f3570b42ae: Pull complete
6bf4b16e5339: Pull complete
9700c9731729: Pull complete
f2fea9c5b632: Pull complete
2f8101f5336d: Pull complete
0dc8f8a1031a: Pull complete
a1b9627588c7: Pull complete
Digest: sha256:5e2ec5964847dd78c83410f228325a462a3bfd796b6133b2bdd590b71721fea6
Status: Downloaded newer image for mysql:5.7
Pulling wordpress (wordpress:latest)...
latest: Pulling from library/wordpress
5040bd298390: Already exists
568dce68541a: Pull complete
6a832068e64c: Pull complete
3b0f3d176a5b: Pull complete
20cc248a5690: Pull complete
6ff565538ee6: Pull complete
9f1077228581: Pull complete
57359f144a19: Pull complete
9754ef36b033: Pull complete
e156df35b624: Pull complete
df09daa2224a: Pull complete
bfa0d8031302: Pull complete
58ec6fadb2c7: Pull complete
254919ae58d3: Pull complete
3fbda78d9add: Pull complete
1f4006165e89: Pull complete
1989a57f5f0b: Pull complete
cd04b95ebe9c: Pull complete
Digest: sha256:b900bc9ceff22ef1dee076c25a67b6d661f9f108b4347a5646e05a11fef9b866
Status: Downloaded newer image for wordpress:latest
```

```
$ docker images
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
wordpress                 latest              2dc5069d7582        10 days ago         400.1 MB
mysql                     5.7                 7666f75adb6b        3 weeks ago         405.6 MB
amazon/amazon-ecs-agent   latest              90be67243de1        4 weeks ago         8.276 MB
```

```
$ docker-compose build
db uses an image, skipping
wordpress uses an image, skipping
```

```
$ docker-compose create
Creating mywordpress_db_1
ERROR: Cannot create container for service db: network mywordpress_default not found
```
[issue](https://github.com/docker/compose/issues/2908)

```
$ docker network create mywordpress_default
92966eac84ace497f54f6684bd5503a4f73a5987e40f466ce57e2e9dd90699a7
```

```
$ docker network ls
NETWORK ID          NAME                  DRIVER              SCOPE
6d2f0d2f96ea        bridge                bridge              local
29e2fd764196        host                  host                local
92966eac84ac        mywordpress_default   bridge              local
f5c821146d06        none                  null                local
```

```
$ docker network inspect mywordpress_default
[
    {
        "Name": "mywordpress_default",
        "Id": "92966eac84ace497f54f6684bd5503a4f73a5987e40f466ce57e2e9dd90699a7",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1/16"
                }
            ]
        },
        "Internal": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]
```

```
$ docker-compose create
Creating mywordpress_db_1
Creating mywordpress_wordpress_1
```

```
$ docker-compose ps
         Name                        Command               State    Ports
-------------------------------------------------------------------------
mywordpress_db_1          docker-entrypoint.sh mysqld      Exit 0
mywordpress_wordpress_1   docker-entrypoint.sh apach ...   Exit 0
```

```
$ docker-compose start
Starting db ... done
Starting wordpress ... done
```

```
$ docker-compose ps
         Name                        Command               State          Ports
---------------------------------------------------------------------------------------
mywordpress_db_1          docker-entrypoint.sh mysqld      Up      3306/tcp
mywordpress_wordpress_1   docker-entrypoint.sh apach ...   Up      0.0.0.0:8000->80/tcp
```

