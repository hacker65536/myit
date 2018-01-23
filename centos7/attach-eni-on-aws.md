
初期状態

```
[root@ip-172-31-3-229 ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:9e:2d:ed:b4:04 brd ff:ff:ff:ff:ff:ff
    inet 172.31.3.229/20 brd 172.31.15.255 scope global dynamic eth0
       valid_lft 3473sec preferred_lft 3473sec
    inet6 fe80::9e:2dff:feed:b404/64 scope link
       valid_lft forever preferred_lft forever
```

attach直後の状態
```
[root@ip-172-31-3-229 ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:9e:2d:ed:b4:04 brd ff:ff:ff:ff:ff:ff
    inet 172.31.3.229/20 brd 172.31.15.255 scope global dynamic eth0
       valid_lft 3351sec preferred_lft 3351sec
    inet6 fe80::9e:2dff:feed:b404/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 1000
    link/ether 02:47:82:a5:13:52 brd ff:ff:ff:ff:ff:ff
```



interface,gateway,macaddress,local-ipv4,cidrの取得方法は他にもあるが便宜上下記の方法で取得を行う
```bash
if=$(ip l | grep "state DOWN" | cut -d " " -f 2 | tr -d ":")
gw=$(ip r | grep "default" | cut -d " " -f 3)
mac=$(ip l | grep -A 1 DOWN | tail -1 | sed 's/^[ \t]*//' | cut -d " " -f 2)
ip=$(hostname -i)
ip2=$(curl -Ss http://169.254.169.254/latest/meta-data/network/interfaces/macs/$mac/local-ipv4s)
cidr=$(curl -Ss http://169.254.169.254/latest/meta-data/network/interfaces/macs/$mac/subnet-ipv4-cidr-block)
echo $if $gw $mac $ip2 $ip $cidr
```

新しいinterfaceの設定を行う
```
cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-${if}
DEVICE=${if}
BOOTPROTO=dhcp
ONBOOT=yes
TYPE=Ethernet
USERCTL=yes
PEERDNS=no
PERSISTENT_DHCLIENT=yes
HWADDR=${mac}
DEFROUTE=no
EOF
```
routeの設定を行う

```
cat <<EOF > /etc/sysconfig/network-scripts/route-${if}
default via ${gw} dev ${if} table 10001
default via ${gw} dev ${if} metric 10001
${cidr} dev ${if} proto kernel scope link src ${ip2} table 10001
EOF
```
ruleの設定を行う
```
cat <<EOF > /etc/sysconfig/network-scripts/rule-${if}
from $ip2 lookup 10001
EOF
```


ifup
```
[root@ip-172-31-23-31 ~]# ifup ${if}

Determining IP information for eth1... done.
[root@ip-172-31-3-229 ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:9e:2d:ed:b4:04 brd ff:ff:ff:ff:ff:ff
    inet 172.31.3.229/20 brd 172.31.15.255 scope global dynamic eth0
       valid_lft 3074sec preferred_lft 3074sec
    inet6 fe80::9e:2dff:feed:b404/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:47:82:a5:13:52 brd ff:ff:ff:ff:ff:ff
    inet 172.31.2.113/20 brd 172.31.15.255 scope global dynamic eth1
       valid_lft 3571sec preferred_lft 3571sec
    inet6 fe80::47:82ff:fea5:1352/64 scope link
       valid_lft forever preferred_lft forever
```



設定の確認
```
[root@ip-172-31-3-229 ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:9e:2d:ed:b4:04 brd ff:ff:ff:ff:ff:ff
    inet 172.31.3.229/20 brd 172.31.15.255 scope global dynamic eth0
       valid_lft 3532sec preferred_lft 3532sec
    inet6 fe80::9e:2dff:feed:b404/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:47:82:a5:13:52 brd ff:ff:ff:ff:ff:ff
    inet 172.31.2.113/20 brd 172.31.15.255 scope global dynamic eth1
       valid_lft 3534sec preferred_lft 3534sec
    inet6 fe80::47:82ff:fea5:1352/64 scope link
       valid_lft forever preferred_lft forever
[root@ip-172-31-3-229 ~]# ip r
default via 172.31.0.1 dev eth0
default via 172.31.0.1 dev eth1 metric 10001
172.31.0.0/20 dev eth0 proto kernel scope link src 172.31.3.229
172.31.0.0/20 dev eth1 proto kernel scope link src 172.31.2.113
[root@ip-172-31-3-229 ~]# ip rule
0:	from all lookup local
32765:	from 172.31.2.113 lookup 10001
32766:	from all lookup main
32767:	from all lookup default
```


別のホストからping
```
[root@ip-172-31-38-241 ~]# ping -c 3 172.31.3.229
PING 172.31.3.229 (172.31.3.229) 56(84) bytes of data.
64 bytes from 172.31.3.229: icmp_seq=1 ttl=64 time=1.12 ms
64 bytes from 172.31.3.229: icmp_seq=2 ttl=64 time=1.11 ms
64 bytes from 172.31.3.229: icmp_seq=3 ttl=64 time=1.10 ms

--- 172.31.3.229 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 1.103/1.114/1.124/0.039 ms
[root@ip-172-31-38-241 ~]# ping -c 3 172.31.2.113
PING 172.31.2.113 (172.31.2.113) 56(84) bytes of data.
64 bytes from 172.31.2.113: icmp_seq=1 ttl=64 time=1.13 ms
64 bytes from 172.31.2.113: icmp_seq=2 ttl=64 time=1.10 ms
64 bytes from 172.31.2.113: icmp_seq=3 ttl=64 time=1.10 ms

--- 172.31.2.113 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 1.105/1.113/1.131/0.040 ms
```

