
初期状態

```
[root@ip-172-31-23-31 ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:ae:17:54:2d:a0 brd ff:ff:ff:ff:ff:ff
    inet 172.31.23.31/20 brd 172.31.31.255 scope global dynamic eth0
       valid_lft 3517sec preferred_lft 3517sec
    inet6 fe80::ae:17ff:fe54:2da0/64 scope link
       valid_lft forever preferred_lft forever
```

attach直後の状態
```
[root@ip-172-31-23-31 ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:ae:17:54:2d:a0 brd ff:ff:ff:ff:ff:ff
    inet 172.31.23.31/20 brd 172.31.31.255 scope global dynamic eth0
       valid_lft 3516sec preferred_lft 3516sec
    inet6 fe80::ae:17ff:fe54:2da0/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 1000
    link/ether 02:d6:86:57:67:12 brd ff:ff:ff:ff:ff:ff
```




down状態の確認は以下の方が正しい
```
[root@ip-172-31-23-31 ~]# find /sys/class/net/eth*
/sys/class/net/eth0
/sys/class/net/eth1
[root@ip-172-31-23-31 ~]# cat /sys/class/net/eth1/operstate
down
[root@ip-172-31-23-31 ~]# cat /sys/class/net/eth0/operstate
up
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


ifup
```
[root@ip-172-31-23-31 ~]# ifup ${if}

Determining IP information for eth1... done.
[root@ip-172-31-23-31 ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:ae:17:54:2d:a0 brd ff:ff:ff:ff:ff:ff
    inet 172.31.23.31/20 brd 172.31.31.255 scope global dynamic eth0
       valid_lft 2763sec preferred_lft 2763sec
    inet6 fe80::ae:17ff:fe54:2da0/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:d6:86:57:67:12 brd ff:ff:ff:ff:ff:ff
    inet 172.31.26.107/20 brd 172.31.31.255 scope global dynamic eth1
       valid_lft 3587sec preferred_lft 3587sec
    inet6 fe80::d6:86ff:fe57:6712/64 scope link
       valid_lft forever preferred_lft forever

```


rule設定
```
[root@ip-172-31-23-31 ~]# ip rule add from $ip2 lookup 10001
```

設定の確認
```
[root@ip-172-31-23-31 ~]# ip r
default via 172.31.16.1 dev eth0
default via 172.31.16.1 dev eth1 metric 10001
172.31.16.0/20 dev eth0 proto kernel scope link src 172.31.23.31
172.31.16.0/20 dev eth1 proto kernel scope link src 172.31.26.107
[root@ip-172-31-23-31 ~]# ip rule
0:      from all lookup local
32765:  from 172.31.26.107 lookup 10001
32766:  from all lookup main
32767:  from all lookup default
[root@ip-172-31-23-31 ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:ae:17:54:2d:a0 brd ff:ff:ff:ff:ff:ff
    inet 172.31.23.31/20 brd 172.31.31.255 scope global dynamic eth0
       valid_lft 2618sec preferred_lft 2618sec
    inet6 fe80::ae:17ff:fe54:2da0/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:d6:86:57:67:12 brd ff:ff:ff:ff:ff:ff
    inet 172.31.26.107/20 brd 172.31.31.255 scope global dynamic eth1
       valid_lft 3442sec preferred_lft 3442sec
    inet6 fe80::d6:86ff:fe57:6712/64 scope link
       valid_lft forever preferred_lft forever
```








