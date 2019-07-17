# ec2 mtu (Maximum Transmission Unit)

https://dev.classmethod.jp/cloud/aws/persistent-mtu-amzn2/



## show current

```console
$ ip link show eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 02:a7:8b:7c:d5:8a brd ff:ff:ff:ff:ff:ff
```

`mtu 9001`

`/var/lib/dhclient/dhclient-eth0.leases`

```
lease {
  interface "eth0";
  fixed-address 172.31.4.66;
  option subnet-mask 255.255.240.0;
  option dhcp-lease-time 3600;
  option routers 172.31.0.1;
  option dhcp-message-type 5;
  option dhcp-server-identifier 172.31.0.1;
  option domain-name-servers 172.31.0.2;
  option interface-mtu 9001;
  option broadcast-address 172.31.15.255;
  option host-name "ip-172-31-4-66";
  option domain-name "us-east-2.compute.internal";
  renew 3 2019/07/17 01:43:49;
  rebind 3 2019/07/17 02:11:12;
  expire 3 2019/07/17 02:18:42;
}
```


## change mtu


```console
$ sudo echo 'MTU=1500' >> /etc/sysconfig/network-scripts/ifcfg-eth0
```

```console
$ sudo cat /etc/dhcp/dhclient.conf
request subnet-mask, broadcast-address, time-offset, routers, domain-name, domain-search, domain-name-servers, host-name, nis-domain, nis-servers, ntp-servers;
timeout 300;
```


## reboot
```console
$ sudo reboot
```


## changed

```console
$ ip link show eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 02:a7:8b:7c:d5:8a brd ff:ff:ff:ff:ff:ff
```

`/var/lib/dhclient/dhclient-eth0.leases`

```
lease {
  interface "eth0";
  fixed-address 172.31.4.66;
  option subnet-mask 255.255.240.0;
  option routers 172.31.0.1;
  option dhcp-lease-time 3600;
  option dhcp-message-type 5;
  option domain-name-servers 172.31.0.2;
  option dhcp-server-identifier 172.31.0.1;
  option broadcast-address 172.31.15.255;
  option host-name "ip-172-31-4-66";
  option domain-name "us-east-2.compute.internal";
  renew 3 2019/07/17 02:54:26;
  rebind 3 2019/07/17 03:22:52;
  expire 3 2019/07/17 03:30:22;
}
```

## mtu

before

```console
$ tracepath amazon.com
 1?: [LOCALHOST]                                         pmtu 9001
 1:  ip-172-31-0-1.us-east-2.compute.internal              0.079ms pmtu 1500
 1:  no reply
 2:  no reply
 3:  no reply
 4:  no reply
 5:  no reply
 6:  100.65.9.161                                          0.414ms
 7:  52.95.1.5                                            12.246ms asymm 28
 8:  52.95.2.142                                          11.929ms asymm 27
 9:  52.95.2.127                                          19.917ms asymm 26
10:  100.91.39.178                                        23.880ms asymm 25
11:  52.93.133.106                                        12.476ms asymm 24
12:  100.91.163.80                                        12.233ms asymm 23
--snip--
27:  no reply
28:  no reply
29:  no reply
30:  no reply
     Too many hops: pmtu 1500
     Resume: pmtu 1500
```


after


```console
$ tracepath amazon.com
 1?: [LOCALHOST]                                         pmtu 1500
 1:  no reply
 2:  no reply
 3:  no reply
 4:  no reply
 5:  no reply
 6:  100.65.9.193                                          1.825ms
 7:  52.95.1.3                                            11.751ms asymm 28
 8:  52.95.2.254                                          18.026ms asymm 27
 9:  52.93.239.86                                         11.853ms asymm 25
10:  100.91.41.4                                          21.275ms asymm 25
11:  52.93.133.64                                         12.101ms asymm 24
---snip---
30:  no reply
31:  no reply
     Too many hops: pmtu 1500
     Resume: pmtu 1500
```
