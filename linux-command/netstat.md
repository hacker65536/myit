# NETSTAT

* --route,-r
** Dispkay the kernel routing tables

```bash
$ netstat -r
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
default         ip-172-31-16-1. 0.0.0.0         UG        0 0          0 eth0
instance-data.u *               255.255.255.255 UH        0 0          0 eth0
172.17.0.0      *               255.255.0.0     U         0 0          0 docker0
172.31.16.0     *               255.255.240.0   U         0 0          0 eth0
```
