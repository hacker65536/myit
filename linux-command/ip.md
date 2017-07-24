ip
===========

query
* addr 
* link
* route
* maddr
* neigh
* help 


```
$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 0a:f8:65:65:1e:e5 brd ff:ff:ff:ff:ff:ff
    inet 172.31.38.241/20 brd 172.31.47.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::8f8:65ff:fe65:1ee5/64 scope link
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
    link/ether 02:42:51:6d:84:c6 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:51ff:fe6d:84c6/64 scope link
       valid_lft forever preferred_lft forever
16: docker_gwbridge: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
    link/ether 02:42:9e:01:df:36 brd ff:ff:ff:ff:ff:ff
    inet 172.18.0.1/16 scope global docker_gwbridge
       valid_lft forever preferred_lft forever
    inet6 fe80::42:9eff:fe01:df36/64 scope link
       valid_lft forever preferred_lft forever
18: vetha4c00c0@if17: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker_gwbridge state UP group default
    link/ether 0e:e5:ed:51:86:81 brd ff:ff:ff:ff:ff:ff link-netnsid 1
    inet6 fe80::ce5:edff:fe51:8681/64 scope link
       valid_lft forever preferred_lft forever
58: veth70920fc@if57: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker_gwbridge state UP group default
    link/ether 06:6a:aa:47:47:90 brd ff:ff:ff:ff:ff:ff link-netnsid 5
    inet6 fe80::46a:aaff:fe47:4790/64 scope link
       valid_lft forever preferred_lft forever
60: vethdcc24b4@if59: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker_gwbridge state UP group default
    link/ether 66:0c:3b:49:91:76 brd ff:ff:ff:ff:ff:ff link-netnsid 4
    inet6 fe80::640c:3bff:fe49:9176/64 scope link
       valid_lft forever preferred_lft forever
62: veth17552ac@if61: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker_gwbridge state UP group default
    link/ether 32:d0:a6:70:44:8d brd ff:ff:ff:ff:ff:ff link-netnsid 6
    inet6 fe80::30d0:a6ff:fe70:448d/64 scope link
       valid_lft forever preferred_lft forever
72: veth84ae5d6@if71: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default
    link/ether 4e:6f:08:61:c2:1b brd ff:ff:ff:ff:ff:ff link-netnsid 7
    inet6 fe80::4c6f:8ff:fe61:c21b/64 scope link
       valid_lft forever preferred_lft forever

```

```
$ ip addr show dev docker0
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
    link/ether 02:42:51:6d:84:c6 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:51ff:fe6d:84c6/64 scope link
       valid_lft forever preferred_lft forever
```

```
$ ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether 0a:f8:65:65:1e:e5 brd ff:ff:ff:ff:ff:ff
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default
    link/ether 02:42:51:6d:84:c6 brd ff:ff:ff:ff:ff:ff
16: docker_gwbridge: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default
    link/ether 02:42:9e:01:df:36 brd ff:ff:ff:ff:ff:ff
18: vetha4c00c0@if17: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker_gwbridge state UP mode DEFAULT group default
    link/ether 0e:e5:ed:51:86:81 brd ff:ff:ff:ff:ff:ff link-netnsid 1
58: veth70920fc@if57: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker_gwbridge state UP mode DEFAULT group default
    link/ether 06:6a:aa:47:47:90 brd ff:ff:ff:ff:ff:ff link-netnsid 5
60: vethdcc24b4@if59: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker_gwbridge state UP mode DEFAULT group default
    link/ether 66:0c:3b:49:91:76 brd ff:ff:ff:ff:ff:ff link-netnsid 4
62: veth17552ac@if61: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker_gwbridge state UP mode DEFAULT group default
    link/ether 32:d0:a6:70:44:8d brd ff:ff:ff:ff:ff:ff link-netnsid 6
72: veth84ae5d6@if71: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP mode DEFAULT group default
    link/ether 4e:6f:08:61:c2:1b brd ff:ff:ff:ff:ff:ff link-netnsid 7
```

```
$ ip link show dev eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether 0a:f8:65:65:1e:e5 brd ff:ff:ff:ff:ff:ff
$ ip link show dev docker0
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default
    link/ether 02:42:51:6d:84:c6 brd ff:ff:ff:ff:ff:ff
```
