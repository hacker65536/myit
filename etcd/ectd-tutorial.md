https://coreos.com/etcd/

https://coreos.com/etcd/docs/latest/getting-started-with-etcd.html

https://github.com/etcd-io/etcd


install
--

https://github.com/etcd-io/etcd/releases

```
ETCD_VER=v3.3.12

# choose either URL
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

# if google isn't available
ret=$(curl -I -L -s -o /dev/null   ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETVER}-linux-amd64.tar.gz -w "%{http_code}")
if [[ $ret != 200 ]]
then
DOWNLOAD_URL=${GITHUB_URL}
fi

curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
```

```console
$ /tmp/etcd-download-test/etcd --version
etcd Version: 3.3.12
Git SHA: d57e8b8
Go Version: go1.10.8
Go OS/Arch: linux/amd64
```

```console
$ ETCDCTL_API=3 /tmp/etcd-download-test/etcdctl version
etcdctl version: 3.3.12
API version: 3.3
```


start
--
```console
$ /tmp/etcd-download-test/etcd
2019-02-18 02:21:01.057251 I | etcdmain: etcd Version: 3.3.12
2019-02-18 02:21:01.057352 I | etcdmain: Git SHA: d57e8b8
2019-02-18 02:21:01.057398 I | etcdmain: Go Version: go1.10.8
2019-02-18 02:21:01.057437 I | etcdmain: Go OS/Arch: linux/amd64
2019-02-18 02:21:01.057475 I | etcdmain: setting maximum number of CPUs to 1, total number of available CPUs is 1
2019-02-18 02:21:01.057534 W | etcdmain: no data-dir provided, using default data-dir ./default.etcd
2019-02-18 02:21:01.057767 I | embed: listening for peers on http://localhost:2380
2019-02-18 02:21:01.057878 I | embed: listening for client requests on localhost:2379
2019-02-18 02:21:01.059484 I | etcdserver: name = default
2019-02-18 02:21:01.059495 I | etcdserver: data dir = default.etcd
2019-02-18 02:21:01.059500 I | etcdserver: member dir = default.etcd/member
2019-02-18 02:21:01.059504 I | etcdserver: heartbeat = 100ms
2019-02-18 02:21:01.059508 I | etcdserver: election = 1000ms
2019-02-18 02:21:01.059512 I | etcdserver: snapshot count = 100000
2019-02-18 02:21:01.059520 I | etcdserver: advertise client URLs = http://localhost:2379
2019-02-18 02:21:01.059525 I | etcdserver: initial advertise peer URLs = http://localhost:2380
2019-02-18 02:21:01.059532 I | etcdserver: initial cluster = default=http://localhost:2380
2019-02-18 02:21:01.061341 I | etcdserver: starting member 8e9e05c52164694d in cluster cdf818194e3a8c32
2019-02-18 02:21:01.061372 I | raft: 8e9e05c52164694d became follower at term 0
2019-02-18 02:21:01.061381 I | raft: newRaft 8e9e05c52164694d [peers: [], term: 0, commit: 0, applied: 0, lastindex: 0, lastterm: 0]
2019-02-18 02:21:01.061386 I | raft: 8e9e05c52164694d became follower at term 1
2019-02-18 02:21:01.065293 W | auth: simple token is not cryptographically signed
2019-02-18 02:21:01.068316 I | etcdserver: starting server... [version: 3.3.12, cluster version: to_be_decided]
2019-02-18 02:21:01.070381 I | etcdserver: 8e9e05c52164694d as single-node; fast-forwarding 9 ticks (election ticks 10)
2019-02-18 02:21:01.070757 I | etcdserver/membership: added member 8e9e05c52164694d [http://localhost:2380] to cluster cdf818194e3a8c32
2019-02-18 02:21:01.661697 I | raft: 8e9e05c52164694d is starting a new election at term 1
2019-02-18 02:21:01.661728 I | raft: 8e9e05c52164694d became candidate at term 2
2019-02-18 02:21:01.661746 I | raft: 8e9e05c52164694d received MsgVoteResp from 8e9e05c52164694d at term 2
2019-02-18 02:21:01.661759 I | raft: 8e9e05c52164694d became leader at term 2
2019-02-18 02:21:01.661767 I | raft: raft.node: 8e9e05c52164694d elected leader 8e9e05c52164694d at term 2
2019-02-18 02:21:01.662334 I | etcdserver: setting up the initial cluster version to 3.3
2019-02-18 02:21:01.662439 I | etcdserver: published {Name:default ClientURLs:[http://localhost:2379]} to cluster cdf818194e3a8c32
2019-02-18 02:21:01.662574 I | embed: ready to serve client requests
2019-02-18 02:21:01.663123 N | embed: serving insecure client requests on 127.0.0.1:2379, this is strongly discouraged!
2019-02-18 02:21:01.663294 E | etcdmain: forgot to set Type=notify in systemd service file?
2019-02-18 02:21:01.663318 N | etcdserver/membership: set the initial cluster version to 3.3
2019-02-18 02:21:01.663361 I | etcdserver/api: enabled capabilities for version 3.3
```

write,read
--
```console
$ ETCDCTL_API=3 /tmp/etcd-download-test/etcdctl --endpoints=localhost:2379 put foo bar
OK
```
```console
$ ETCDCTL_API=3 /tmp/etcd-download-test/etcdctl --endpoints=localhost:2379 get foo
foo
bar
```
