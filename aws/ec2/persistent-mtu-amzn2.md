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
