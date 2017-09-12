# elasticsearch install

from source

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

rpm
```
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo tee -a /etc/yum.repos.d/elasticsearch.repo > /dev/null <<'EOF'
[elasticsearch-5.x]
name=Elasticsearch repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
```
```
sudo yum isntall -y elasticsearch
sudo chkconfig --add elasticsearch
```

```
sudo service elasticsearch start
Starting elasticsearch: Elasticsearch requires at least Java 8 but your Java version from /usr/bin/java does not meet this requirement
                                                           [FAILED]
```

install java8
```
sudo yum install java-1.8.0
sudo alternatives --set java  /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
```

run
```
$ sudo service elasticsearch start
Starting elasticsearch:                                    [  OK  ]
$ ps aux|grep elast
498       6463  100 30.4 5768532 2332624 ?     Sl   05:34   0:13 /usr/bin/java -Xms2g -Xmx2g -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+AlwaysPreTouch -server -Xss1m -Djava.awt.headless=true -Dfile.encoding=UTF-8 -Djna.nosys=true -Djdk.io.permissionsUseCanonicalPath=true -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Dlog4j.skipJansi=true -XX:+HeapDumpOnOutOfMemoryError -Des.path.home=/usr/share/elasticsearch -cp /usr/share/elasticsearch/lib/* org.elasticsearch.bootstrap.Elasticsearch -p /var/run/elasticsearch/elasticsearch.pid -d -Edefault.path.logs=/var/log/elasticsearch -Edefault.path.data=/var/lib/elasticsearch -Edefault.path.conf=/etc/elasticsearch
ec2-user  6517  0.0  0.0 110468  2128 pts/0    S+   05:34   0:00 grep --color=auto elast
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

docker-compose.yml
```yml
version: '2'
services:
  elasticsearch1:
    image: docker.elastic.co/elasticsearch/elasticsearch:5.6.0
    container_name: elasticsearch1
    environment:
      - cluster.name=docker-cluster
      - bootstrap.memory_lock=true
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ulimits:
      memlock:
        soft: -1
        hard: -1
    mem_limit: 1g
    volumes:
      - esdata1:/usr/share/elasticsearch/data
    ports:
      - 9200:9200
    networks:
      - esnet
  elasticsearch2:
    image: docker.elastic.co/elasticsearch/elasticsearch:5.6.0
    environment:
      - cluster.name=docker-cluster
      - bootstrap.memory_lock=true
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
      - "discovery.zen.ping.unicast.hosts=elasticsearch1"
    ulimits:
      memlock:
        soft: -1
        hard: -1
    mem_limit: 1g
    volumes:
      - esdata2:/usr/share/elasticsearch/data
    networks:
      - esnet

volumes:
  esdata1:
    driver: local
  esdata2:
    driver: local

networks:
  esnet:
 ```
 
 ```
 docker-compose up
 ```
 have an error
 ```
 [ec2-user@ip-172-31-40-124 elastic]$ docker-compose up
Creating network "elastic_esnet" with the default driver
Creating elasticsearch1 ...
Creating elastic_elasticsearch2_1 ...
Creating elasticsearch1
Creating elastic_elasticsearch2_1 ... done
Attaching to elasticsearch1, elastic_elasticsearch2_1
elasticsearch1    | [2017-09-12T03:54:56,711][INFO ][o.e.n.Node               ] [] initializing ...
elasticsearch2_1  | [2017-09-12T03:54:56,821][INFO ][o.e.n.Node               ] [] initializing ...
elasticsearch1    | [2017-09-12T03:54:56,836][INFO ][o.e.e.NodeEnvironment    ] [RaXwWEU] using [1] data paths, mounts [[/usr/share/elasticsearch/data (/dev/xvda1)]], net usable_space [6gb], net total_space [7.7gb], spins? [possibly], types [ext4]
elasticsearch1    | [2017-09-12T03:54:56,837][INFO ][o.e.e.NodeEnvironment    ] [RaXwWEU] heap size [494.9mb], compressed ordinary object pointers [true]
elasticsearch1    | [2017-09-12T03:54:56,838][INFO ][o.e.n.Node               ] node name [RaXwWEU] derived from node ID [RaXwWEUgTTyeEeh3XyuGUA]; set [node.name] to override
elasticsearch1    | [2017-09-12T03:54:56,839][INFO ][o.e.n.Node               ] version[5.6.0], pid[1], build[781a835/2017-09-07T03:09:58.087Z], OS[Linux/4.9.43-17.38.amzn1.x86_64/amd64], JVM[Oracle Corporation/OpenJDK 64-Bit Server VM/1.8.0_141/25.141-b16]
elasticsearch1    | [2017-09-12T03:54:56,839][INFO ][o.e.n.Node               ] JVM arguments [-Xms2g, -Xmx2g, -XX:+UseConcMarkSweepGC, -XX:CMSInitiatingOccupancyFraction=75, -XX:+UseCMSInitiatingOccupancyOnly, -XX:+AlwaysPreTouch, -Xss1m, -Djava.awt.headless=true, -Dfile.encoding=UTF-8, -Djna.nosys=true, -Djdk.io.permissionsUseCanonicalPath=true, -Dio.netty.noUnsafe=true, -Dio.netty.noKeySetOptimization=true, -Dio.netty.recycler.maxCapacityPerThread=0, -Dlog4j.shutdownHookEnabled=false, -Dlog4j2.disable.jmx=true, -Dlog4j.skipJansi=true, -XX:+HeapDumpOnOutOfMemoryError, -Des.cgroups.hierarchy.override=/, -Xms512m, -Xmx512m, -Des.path.home=/usr/share/elasticsearch]
elasticsearch2_1  | [2017-09-12T03:54:56,945][INFO ][o.e.e.NodeEnvironment    ] [mZVjhK5] using [1] data paths, mounts [[/usr/share/elasticsearch/data (/dev/xvda1)]], net usable_space [6gb], net total_space [7.7gb], spins? [possibly], types [ext4]
elasticsearch2_1  | [2017-09-12T03:54:56,946][INFO ][o.e.e.NodeEnvironment    ] [mZVjhK5] heap size [494.9mb], compressed ordinary object pointers [true]
elasticsearch2_1  | [2017-09-12T03:54:56,947][INFO ][o.e.n.Node               ] node name [mZVjhK5] derived from node ID [mZVjhK5ATYm2HHuiL5Pjdg]; set [node.name] to override
elasticsearch2_1  | [2017-09-12T03:54:56,947][INFO ][o.e.n.Node               ] version[5.6.0], pid[1], build[781a835/2017-09-07T03:09:58.087Z], OS[Linux/4.9.43-17.38.amzn1.x86_64/amd64], JVM[Oracle Corporation/OpenJDK 64-Bit Server VM/1.8.0_141/25.141-b16]
elasticsearch2_1  | [2017-09-12T03:54:56,948][INFO ][o.e.n.Node               ] JVM arguments [-Xms2g, -Xmx2g, -XX:+UseConcMarkSweepGC, -XX:CMSInitiatingOccupancyFraction=75, -XX:+UseCMSInitiatingOccupancyOnly, -XX:+AlwaysPreTouch, -Xss1m, -Djava.awt.headless=true, -Dfile.encoding=UTF-8, -Djna.nosys=true, -Djdk.io.permissionsUseCanonicalPath=true, -Dio.netty.noUnsafe=true, -Dio.netty.noKeySetOptimization=true, -Dio.netty.recycler.maxCapacityPerThread=0, -Dlog4j.shutdownHookEnabled=false, -Dlog4j2.disable.jmx=true, -Dlog4j.skipJansi=true, -XX:+HeapDumpOnOutOfMemoryError, -Des.cgroups.hierarchy.override=/, -Xms512m, -Xmx512m, -Des.path.home=/usr/share/elasticsearch]
elasticsearch1    | [2017-09-12T03:54:59,651][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [aggs-matrix-stats]
elasticsearch1    | [2017-09-12T03:54:59,651][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [ingest-common]
elasticsearch1    | [2017-09-12T03:54:59,651][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [lang-expression]
elasticsearch1    | [2017-09-12T03:54:59,651][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [lang-groovy]
elasticsearch1    | [2017-09-12T03:54:59,652][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [lang-mustache]
elasticsearch1    | [2017-09-12T03:54:59,652][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [lang-painless]
elasticsearch1    | [2017-09-12T03:54:59,652][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [parent-join]
elasticsearch1    | [2017-09-12T03:54:59,652][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [percolator]
elasticsearch1    | [2017-09-12T03:54:59,652][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [reindex]
elasticsearch1    | [2017-09-12T03:54:59,652][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [transport-netty3]
elasticsearch1    | [2017-09-12T03:54:59,652][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded module [transport-netty4]
elasticsearch1    | [2017-09-12T03:54:59,652][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded plugin [ingest-geoip]
elasticsearch1    | [2017-09-12T03:54:59,653][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded plugin [ingest-user-agent]
elasticsearch1    | [2017-09-12T03:54:59,653][INFO ][o.e.p.PluginsService     ] [RaXwWEU] loaded plugin [x-pack]
elasticsearch2_1  | [2017-09-12T03:54:59,778][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [aggs-matrix-stats]
elasticsearch2_1  | [2017-09-12T03:54:59,778][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [ingest-common]
elasticsearch2_1  | [2017-09-12T03:54:59,778][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [lang-expression]
elasticsearch2_1  | [2017-09-12T03:54:59,778][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [lang-groovy]
elasticsearch2_1  | [2017-09-12T03:54:59,778][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [lang-mustache]
elasticsearch2_1  | [2017-09-12T03:54:59,778][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [lang-painless]
elasticsearch2_1  | [2017-09-12T03:54:59,778][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [parent-join]
elasticsearch2_1  | [2017-09-12T03:54:59,778][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [percolator]
elasticsearch2_1  | [2017-09-12T03:54:59,778][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [reindex]
elasticsearch2_1  | [2017-09-12T03:54:59,778][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [transport-netty3]
elasticsearch2_1  | [2017-09-12T03:54:59,779][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded module [transport-netty4]
elasticsearch2_1  | [2017-09-12T03:54:59,779][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded plugin [ingest-geoip]
elasticsearch2_1  | [2017-09-12T03:54:59,779][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded plugin [ingest-user-agent]
elasticsearch2_1  | [2017-09-12T03:54:59,779][INFO ][o.e.p.PluginsService     ] [mZVjhK5] loaded plugin [x-pack]
elasticsearch1    | [2017-09-12T03:55:03,500][INFO ][o.e.x.m.j.p.l.CppLogMessageHandler] [controller/55] [Main.cc@128] controller (64 bit): Version 5.6.0 (Build 93aea61f57f7d8) Copyright (c) 2017 Elasticsearch BV
elasticsearch1    | [2017-09-12T03:55:03,529][INFO ][o.e.d.DiscoveryModule    ] [RaXwWEU] using discovery type [zen]
elasticsearch2_1  | [2017-09-12T03:55:03,958][INFO ][o.e.x.m.j.p.l.CppLogMessageHandler] [controller/54] [Main.cc@128] controller (64 bit): Version 5.6.0 (Build 93aea61f57f7d8) Copyright (c) 2017 Elasticsearch BV
elasticsearch2_1  | [2017-09-12T03:55:04,044][INFO ][o.e.d.DiscoveryModule    ] [mZVjhK5] using discovery type [zen]
elasticsearch1    | [2017-09-12T03:55:05,754][INFO ][o.e.n.Node               ] initialized
elasticsearch1    | [2017-09-12T03:55:05,754][INFO ][o.e.n.Node               ] [RaXwWEU] starting ...
elasticsearch2_1  | [2017-09-12T03:55:05,955][INFO ][o.e.n.Node               ] initialized
elasticsearch2_1  | [2017-09-12T03:55:05,955][INFO ][o.e.n.Node               ] [mZVjhK5] starting ...
elasticsearch1    | [2017-09-12T03:55:06,267][INFO ][o.e.t.TransportService   ] [RaXwWEU] publish_address {172.18.0.3:9300}, bound_addresses {[::]:9300}
elasticsearch1    | [2017-09-12T03:55:06,294][INFO ][o.e.b.BootstrapChecks    ] [RaXwWEU] bound or publishing to a non-loopback or non-link-local address, enforcing bootstrap checks
elasticsearch1    | ERROR: [2] bootstrap checks failed
elasticsearch1    | [1]: max file descriptors [4096] for elasticsearch process is too low, increase to at least [65536]
elasticsearch1    | [2]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
elasticsearch1    | [2017-09-12T03:55:06,313][INFO ][o.e.n.Node               ] [RaXwWEU] stopping ...
elasticsearch2_1  | [2017-09-12T03:55:06,438][INFO ][o.e.t.TransportService   ] [mZVjhK5] publish_address {172.18.0.2:9300}, bound_addresses {[::]:9300}
elasticsearch2_1  | [2017-09-12T03:55:06,464][INFO ][o.e.b.BootstrapChecks    ] [mZVjhK5] bound or publishing to a non-loopback or non-link-local address, enforcing bootstrap checks
elasticsearch2_1  | ERROR: [2] bootstrap checks failed
elasticsearch2_1  | [1]: max file descriptors [4096] for elasticsearch process is too low, increase to at least [65536]
elasticsearch2_1  | [2]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
elasticsearch2_1  | [2017-09-12T03:55:06,485][INFO ][o.e.n.Node               ] [mZVjhK5] stopping ...
elasticsearch1    | [2017-09-12T03:55:06,569][INFO ][o.e.n.Node               ] [RaXwWEU] stopped
elasticsearch1    | [2017-09-12T03:55:06,569][INFO ][o.e.n.Node               ] [RaXwWEU] closing ...
elasticsearch1    | [2017-09-12T03:55:06,589][INFO ][o.e.n.Node               ] [RaXwWEU] closed
elasticsearch2_1  | [2017-09-12T03:55:06,597][INFO ][o.e.n.Node               ] [mZVjhK5] stopped
elasticsearch2_1  | [2017-09-12T03:55:06,597][INFO ][o.e.n.Node               ] [mZVjhK5] closing ...
elasticsearch2_1  | [2017-09-12T03:55:06,658][INFO ][o.e.n.Node               ] [mZVjhK5] closed
elastic_elasticsearch2_1 exited with code 78
elasticsearch1 exited with code 78
[ec2-user@ip-172-31-40-124 elastic]$ docker-compose ps
          Name                     Command            State    Ports
--------------------------------------------------------------------
elastic_elasticsearch2_1   /bin/bash bin/es-docker   Exit 78
elasticsearch1             /bin/bash bin/es-docker   Exit 78
```

```
elasticsearch2_1  | [2]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```
```
sudo tee -a /etc/sysctl.conf > /dev/null <<'EOF'
# for elasticsearch cluster on docker
vm.max_map_count=262144
EOF
```
```
sudo sysctl -p | grep vm.max_map_count 
```

temporary
```
sudo sysctl -w vm.max_map_count=262144
```
```
elasticsearch2_1  | [1]: max file descriptors [4096] for elasticsearch process is too low, increase to at least [65536]
```

add following to docker-compose.yml
```
ulimits:
    nofile:
       soft: 65536
       hard: 65536
```       

```
$ docker-compose ps
          Name                     Command           State                Ports
---------------------------------------------------------------------------------------------
elastic_elasticsearch2_1   /bin/bash bin/es-docker   Up      9200/tcp, 9300/tcp
elasticsearch1             /bin/bash bin/es-docker   Up      0.0.0.0:9200->9200/tcp, 9300/tcp
```

```
$ curl -u elastic:changeme  http://127.0.0.1:9200/_cat/health
1505193271 05:14:31 docker-cluster green 2 2 8 4 0 0 0 0 - 100.0%
```

```
$ docker stats
CONTAINER           CPU %               MEM USAGE / LIMIT   MEM %               NET I/O             BLOCK I/O           PIDS
1e2a86a323a0        0.39%               901 MiB / 1 GiB     87.99%              1.74 MB / 1.72 MB   0 B / 2.78 MB       0
66e88b3de688        0.34%               912.9 MiB / 1 GiB   89.15%              1.73 MB / 1.74 MB   434 kB / 2.47 MB    0
```
