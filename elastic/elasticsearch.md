# elasticsearch install


https://www.elastic.co/guide/en/elasticsearch/reference/current/zip-targz.html

5.6.0 require java8

install java8
```
sudo yum install java-1.8.0
sudo alternatives --set java  /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
```


```
curl -SsL -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.0.tar.gz
tar xf !$:t
cd !$:r:r
./bin/elasticsearch
```

running as a daemon
```
./bin/elasticsearch -d -p pid

kill `cat pid`
```


check elasticsearch is running

```
$ curl -XGET 'localhost:9200/?pretty'
{
  "name" : "vnEqLgm",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "XIJ4NZGBRby4T9avtmzdTA",
  "version" : {
    "number" : "5.6.0",
    "build_hash" : "781a835",
    "build_date" : "2017-09-07T03:09:58.087Z",
    "build_snapshot" : false,
    "lucene_version" : "6.6.0"
  },
  "tagline" : "You Know, for Search"
}

```


https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

docker (unnecessary java8)
```
# docker pull docker.elastic.co/elasticsearch/elasticsearch:5.6.0
docker run -p 9200:9200 \
-e "http.host=0.0.0.0" \
-e "transport.host=127.0.0.1" docker.elastic.co/elasticsearch/elasticsearch:5.6.0
```

```
$ docker images
REPOSITORY                                      TAG                 IMAGE ID            CREATED             SIZE
docker.elastic.co/elasticsearch/elasticsearch   5.6.0               b556c5169ee4        12 hours ago        510 MB
```

```
$ docker run -d -p 9200:9200 -e "http.host=0.0.0.0" -e "transport.host=127.0.0.1" docker.elastic.co/elasticsearch/elasticsearch:5.6.0
891c26b8ce7de04bb13c0a565794a65e8bfd5e67206b37211345680d9505746c
```
```
$ docker ps
CONTAINER ID        IMAGE                                                 COMMAND                  CREATED             STATUS              PORTS                              NAMES
891c26b8ce7d        docker.elastic.co/elasticsearch/elasticsearch:5.6.0   "/bin/bash bin/es-..."   18 seconds ago      Up 17 seconds       0.0.0.0:9200->9200/tcp, 9300/tcp   laughing_shannon
```

```
curl -u elastic:changeme  http://127.0.0.1:9200/_cat/health
1505187934 03:45:34 docker-cluster yellow 1 1 5 5 0 0 5 0 - 50.0%
```
