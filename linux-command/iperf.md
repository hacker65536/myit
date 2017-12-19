
edit securitygroup


server and client
```
yum install iperf3
```


server
```
[root@ip-172-31-7-232 ~]# iperf3 -s
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
Accepted connection from 18.216.22.139, port 41654
[  5] local 172.31.7.232 port 5201 connected to 18.216.22.139 port 41656
[ ID] Interval           Transfer     Bandwidth
[  5]   0.00-1.00   sec  9.25 MBytes  77.6 Mbits/sec
[  5]   1.00-2.00   sec  20.9 MBytes   175 Mbits/sec
[  5]   2.00-3.00   sec  20.9 MBytes   175 Mbits/sec
[  5]   3.00-4.00   sec  20.9 MBytes   175 Mbits/sec
[  5]   4.00-5.00   sec  20.0 MBytes   168 Mbits/sec
[  5]   5.00-6.00   sec  10.1 MBytes  84.7 Mbits/sec
[  5]   6.00-7.00   sec  11.0 MBytes  92.1 Mbits/sec
[  5]   7.00-8.00   sec  9.21 MBytes  77.3 Mbits/sec
[  5]   8.00-9.00   sec  8.45 MBytes  70.9 Mbits/sec
[  5]   9.00-10.00  sec  9.13 MBytes  76.6 Mbits/sec
[  5]  10.00-10.07  sec   683 KBytes  78.6 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  5]   0.00-10.07  sec  0.00 Bytes  0.00 bits/sec                  sender
[  5]   0.00-10.07  sec   140 MBytes   117 Mbits/sec                  receiver
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
^Ciperf3: interrupt - the server has terminated
```

clietn
```
[root@ip-172-31-15-69 ~]# iperf3 -c 52.89.38.202
Connecting to host 52.89.38.202, port 5201
[  4] local 172.31.15.69 port 41656 connected to 52.89.38.202 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  12.6 MBytes   106 Mbits/sec    0   3.00 MBytes
[  4]   1.00-2.00   sec  21.2 MBytes   178 Mbits/sec    0   3.00 MBytes
[  4]   2.00-3.00   sec  20.0 MBytes   168 Mbits/sec    0   3.00 MBytes
[  4]   3.00-4.00   sec  21.2 MBytes   178 Mbits/sec    0   3.00 MBytes
[  4]   4.00-5.00   sec  20.0 MBytes   168 Mbits/sec   30    707 KBytes
[  4]   5.00-6.00   sec  10.0 MBytes  83.9 Mbits/sec  1255    764 KBytes
[  4]   6.00-7.00   sec  11.2 MBytes  94.4 Mbits/sec    0    820 KBytes
[  4]   7.00-8.00   sec  8.75 MBytes  73.4 Mbits/sec   77    618 KBytes
[  4]   8.00-9.00   sec  8.75 MBytes  73.4 Mbits/sec    0    659 KBytes
[  4]   9.00-10.00  sec  8.75 MBytes  73.4 Mbits/sec    0    686 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec   143 MBytes   120 Mbits/sec  1362             sender
[  4]   0.00-10.00  sec   140 MBytes   118 Mbits/sec                  receiver

iperf Done.
```
