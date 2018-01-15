



```
node 1 172.31.5.102/18.218.109.44
node 2 172.31.13.112/18.218.157.71
node 3 172.31.0.250/18.217.205.185
```


node 1 (manager)
```
# docker swarm init --advertise-addr $(hostname -i)
Swarm initialized: current node (x1vw7z5yfvl63slmdbfxc4w2t) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-3whwma0awzf8g9t5uubeevl3jtj54nd50jebzi12osjpxtbh7d-1mflhndrtly24a6v947wj00z5 172.31.5.102:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```
```
# docker info |grep -A 21 "Swarm"
Swarm: active
 NodeID: x1vw7z5yfvl63slmdbfxc4w2t
 Is Manager: true
 ClusterID: l734g9601sn6fkkii16swo7kc
 Managers: 1
 Nodes: 1
 Orchestration:
  Task History Retention Limit: 5
 Raft:
  Snapshot Interval: 10000
  Number of Old Snapshots to Retain: 0
  Heartbeat Tick: 1
  Election Tick: 3
 Dispatcher:
  Heartbeat Period: 5 seconds
 CA Configuration:
  Expiry Duration: 3 months
  Force Rotate: 0
 Root Rotation In Progress: false
 Node Address: 172.31.5.102
 Manager Addresses:
  172.31.5.102:2377
```

node 2
```
# docker swarm join --token SWMTKN-1-3whwma0awzf8g9t5uubeevl3jtj54nd50jebzi12osjpxtbh7d-1mflhndrtly24a6v947wj00z5 172.31.5.102:2377
This node joined a swarm as a worker.

# docker info | grep -A 5 "Swarm"
Swarm: active
 NodeID: oln41yj4jove1x1efmwqyxgsh
 Is Manager: false
 Node Address: 172.31.13.112
 Manager Addresses:
  172.31.5.102:2377
```

node 3
```
# docker swarm join --token SWMTKN-1-3whwma0awzf8g9t5uubeevl3jtj54nd50jebzi12osjpxtbh7d-1mflhndrtly24a6v947wj00z5 172.31.5.102:2377
This node joined a swarm as a worker.

# docker info | grep -A 5 "Swarm"
Swarm: active
 NodeID: uyo30tbbhsafa2i0c63mo85mt
 Is Manager: false
 Node Address: 172.31.0.250
 Manager Addresses:
  172.31.5.102:2377
```

node 1
```
# docker node ls
ID                            HOSTNAME                                      STATUS              AVAILABILITY        MANAGER STATUS
oln41yj4jove1x1efmwqyxgsh     ip-172-31-13-112.us-east-2.compute.internal   Ready               Active
uyo30tbbhsafa2i0c63mo85mt     ip-172-31-0-250.us-east-2.compute.internal    Ready               Active
x1vw7z5yfvl63slmdbfxc4w2t *   ip-172-31-5-102.us-east-2.compute.internal    Ready               Active              Leader
```

create service
```
# docker service create --replicas 1 --name swarmapp -p 80:80 nginx:latest
wr03yy28ejjmko5a6ycpjmwxc
Since --detach=false was not specified, tasks will be created in the background.
In a future release, --detach=false will become the default.
```
```
# docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
wr03yy28ejjm        swarmapp            replicated          1/1                 nginx:latest        *:80->80/tcp
```
```
# docker service ps swarmapp
ID                  NAME                IMAGE               NODE                                         DESIRED STATE       CURRENT STATE           ERROR               PORTS
xcu2g822iict        swarmapp.1          nginx:latest        ip-172-31-5-102.us-east-2.compute.internal   Running             Running 3 minutes ago 
```
```
# docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
132a76d887a4        nginx:latest        "nginx -g 'daemon ..."   3 minutes ago       Up 3 minutes        80/tcp              swarmapp.1.xcu2g822iictraa25pry51aq7
```

```
$ curl -s 18.218.109.44
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```


```
# same contents
$ curl -s 18.218.157.71
```
```
# same contents
$ curl -s 18.217.205.185
```
