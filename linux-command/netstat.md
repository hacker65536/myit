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

* --interfaces=iface, -I=iface , -i
 * Display a table of all network interfaces, or the specified iface.
```bash
$ netstat -i
Kernel Interface table
Iface       MTU Met    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
docker0    1500   0        0      0      0      0        0      0      0      0 BMU
eth0       9001   0    11391      0      0      0    10820      0      0      0 BMRU
lo        65536   0        2      0      0      0        2      0      0      0 LRU
```

```bash
$ netstat -I=docker0
Kernel Interface table
Iface       MTU Met    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
docker0    1500   0        0      0      0      0        0      0      0      0 BMU

$ netstat -I=eth0
Kernel Interface table
Iface       MTU Met    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       9001   0    11446      0      0      0    10860      0      0      0 BMRU
```

* --masquerade, -M
 * Display a list of masqueraded connections.

this option is for ipchains. not support iptables.

```bash
$ netstat -M
netstat: no support for `ip_masquerade' on this system.
$ sudo iptables -L -n -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  10.2.0.0/16          0.0.0.0/0
```


all Show  both listening and non-listening (for TCP this means established connections) sockets
```
netstat -a
```

tcp connection
```
netstat -at
```

udp connection
```
netstat -au
```

withtout reverse dns lookup
```
netstat -ant
```

list all listening conditions 
```
netstat -l
```

list only listening tcp ports
```
netstat -tl
```

display summary statistics
```
netstat -s
```

display statistics tcp
```
netstat -st
```

displays domain name where possible for IP address  
(print routing information from FIB (forwarding information base))
```
netstat -F
```

-n --numeric-hosts --numeric-ports
```
netstat -n
```


ipv6 (https://qiita.com/fetaro/items/d5164ba8271114d8a0c8)
```
# netstat -tnlp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      1/systemd
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      3435/sshd
tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN      3284/master
tcp6       0      0 :::111                  :::*                    LISTEN      1/systemd
tcp6       0      0 :::80                   :::*                    LISTEN      9098/httpd
tcp6       0      0 :::22                   :::*                    LISTEN      3435/sshd
```
```
# lsof -i:80
COMMAND  PID   USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
httpd   9098   root    4u  IPv6  69635      0t0  TCP *:http (LISTEN)
httpd   9099 apache    4u  IPv6  69635      0t0  TCP *:http (LISTEN)
httpd   9100 apache    4u  IPv6  69635      0t0  TCP *:http (LISTEN)
httpd   9101 apache    4u  IPv6  69635      0t0  TCP *:http (LISTEN)
httpd   9102 apache    4u  IPv6  69635      0t0  TCP *:http (LISTEN)
httpd   9103 apache    4u  IPv6  69635      0t0  TCP *:http (LISTEN)
```
