# NETSTAT

* --route,-r
  * Dispkay the kernel routing tables

```bash
$ netstat -r
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
default         ip-172-31-16-1. 0.0.0.0         UG        0 0          0 eth0
instance-data.u *               255.255.255.255 UH        0 0          0 eth0
172.17.0.0      *               255.255.0.0     U         0 0          0 docker0
172.31.16.0     *               255.255.240.0   U         0 0          0 eth0
```

* --groups,-g
  * Display multicast group membership information for IPv4 and IPv6
```bash
$ netstat -g
IPv6/IPv4 Group Memberships
Interface       RefCnt Group
--------------- ------ ---------------------
lo              1      all-systems.mcast.net
eth0            1      all-systems.mcast.net
docker0         1      all-systems.mcast.net
lo              1      ff02::1
lo              1      ff01::1
eth0            1      ff02::202
eth0            1      ff02::1:ff0b:3d43
eth0            1      ff02::1
eth0            1      ff01::1
docker0         1      ff02::1
docker0         1      ff01::1
```
