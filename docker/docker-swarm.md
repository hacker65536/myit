



```
node 1 172.31.5.102
node 2 172.31.13.112
node 3 172.31.0.250
```


node 1
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
