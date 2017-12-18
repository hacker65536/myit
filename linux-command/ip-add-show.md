
ip


```bash
$ ip add show help
Usage: ip address {add|change|replace} IFADDR dev IFNAME [ LIFETIME ]
                                                      [ CONFFLAG-LIST ]
       ip address del IFADDR dev IFNAME [mngtmpaddr]
       ip address {save|flush} [ dev IFNAME ] [ scope SCOPE-ID ]
                            [ to PREFIX ] [ FLAG-LIST ] [ label LABEL ] [up]
       ip address [ show [ dev IFNAME ] [ scope SCOPE-ID ] [ master DEVICE ]
                         [ type TYPE ] [ to PREFIX ] [ FLAG-LIST ]
                         [ label LABEL ] [up] ]
       ip address {showdump|restore}
IFADDR := PREFIX | ADDR peer PREFIX
          [ broadcast ADDR ] [ anycast ADDR ]
          [ label IFNAME ] [ scope SCOPE-ID ]
SCOPE-ID := [ host | link | global | NUMBER ]
FLAG-LIST := [ FLAG-LIST ] FLAG
FLAG  := [ permanent | dynamic | secondary | primary |
           [-]tentative | [-]deprecated | [-]dadfailed | temporary |
           CONFFLAG-LIST ]
CONFFLAG-LIST := [ CONFFLAG-LIST ] CONFFLAG
CONFFLAG  := [ home | nodad | mngtmpaddr | noprefixroute | autojoin ]
LIFETIME := [ valid_lft LFT ] [ preferred_lft LFT ]
LFT := forever | SECONDS
TYPE := { vlan | veth | vcan | dummy | ifb | macvlan | macvtap |
          bridge | bond | ipoib | ip6tnl | ipip | sit | vxlan |
          gre | gretap | ip6gre | ip6gretap | vti | nlmon |
          bond_slave | ipvlan | geneve | bridge_slave | vrf | macsec }
```

```
$ ip add
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 0a:aa:57:92:1d:5a brd ff:ff:ff:ff:ff:ff
    inet 172.31.2.23/20 brd 172.31.15.255 scope global dynamic ens3
       valid_lft 3583sec preferred_lft 3583sec
    inet6 fe80::8aa:57ff:fe92:1d5a/64 scope link
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP
    link/ether 02:42:d4:56:2f:2c brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:d4ff:fe56:2f2c/64 scope link
       valid_lft forever preferred_lft forever
5: veth45b8063@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP
    link/ether 4a:c7:98:6c:f1:5c brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::48c7:98ff:fe6c:f15c/64 scope link
       valid_lft forever preferred_lft forever

```

```
$ ip add show dynamic
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 0a:aa:57:92:1d:5a brd ff:ff:ff:ff:ff:ff
    inet 172.31.2.23/20 brd 172.31.15.255 scope global dynamic ens3
       valid_lft 2248sec preferred_lft 2248sec
```

```
$ ip add show scope link
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 0a:aa:57:92:1d:5a brd ff:ff:ff:ff:ff:ff
    inet6 fe80::8aa:57ff:fe92:1d5a/64 scope link
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP
    link/ether 02:42:d4:56:2f:2c brd ff:ff:ff:ff:ff:ff
    inet6 fe80::42:d4ff:fe56:2f2c/64 scope link
       valid_lft forever preferred_lft forever
5: veth45b8063@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP
    link/ether 4a:c7:98:6c:f1:5c brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::48c7:98ff:fe6c:f15c/64 scope link
       valid_lft forever preferred_lft forever

```
```
$ ip a show label ens*
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 0a:aa:57:92:1d:5a brd ff:ff:ff:ff:ff:ff
    inet 172.31.2.23/20 brd 172.31.15.255 scope global dynamic ens3
       valid_lft 3166sec preferred_lft 3166sec
    inet6 fe80::8aa:57ff:fe92:1d5a/64 scope link
       valid_lft forever preferred_lft forever
```

```
$ ip a show scope link type bridge
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP
    link/ether 02:42:d4:56:2f:2c brd ff:ff:ff:ff:ff:ff
    inet6 fe80::42:d4ff:fe56:2f2c/64 scope link
       valid_lft forever preferred_lft forever
```

```
$ ip a show scope link type veth
5: veth45b8063@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP
    link/ether 4a:c7:98:6c:f1:5c brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::48c7:98ff:fe6c:f15c/64 scope link
       valid_lft forever preferred_lft forever
```
```
$ ip a show scope link type bridge_slave
5: veth45b8063@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP
    link/ether 4a:c7:98:6c:f1:5c brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::48c7:98ff:fe6c:f15c/64 scope link
       valid_lft forever preferred_lft forever
```
