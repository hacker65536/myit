
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



insert time
```
[root@ip-172-31-15-69 ~]# iperf3 -c 52.89.38.202 -T `date +%F`
2017-12-19:  Connecting to host 52.89.38.202, port 5201
2017-12-19:  [  4] local 172.31.15.69 port 41736 connected to 52.89.38.202 port 5201
2017-12-19:  [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
2017-12-19:  [  4]   0.00-1.00   sec  9.69 MBytes  81.3 Mbits/sec  644   1.44 MBytes
2017-12-19:  [  4]   1.00-2.00   sec  10.0 MBytes  83.9 Mbits/sec  381    773 KBytes
2017-12-19:  [  4]   2.00-3.00   sec  8.75 MBytes  73.4 Mbits/sec   27    588 KBytes
2017-12-19:  [  4]   3.00-4.00   sec  8.75 MBytes  73.4 Mbits/sec    0    625 KBytes
2017-12-19:  [  4]   4.00-5.00   sec  8.75 MBytes  73.4 Mbits/sec    0    648 KBytes
2017-12-19:  [  4]   5.00-6.00   sec  8.75 MBytes  73.4 Mbits/sec    0    660 KBytes
2017-12-19:  [  4]   6.00-7.00   sec  8.75 MBytes  73.4 Mbits/sec    0    665 KBytes
2017-12-19:  [  4]   7.00-8.00   sec  8.75 MBytes  73.4 Mbits/sec    0    665 KBytes
2017-12-19:  [  4]   8.00-9.00   sec  10.0 MBytes  83.9 Mbits/sec    0    665 KBytes
2017-12-19:  [  4]   9.00-10.00  sec  8.75 MBytes  73.4 Mbits/sec    0    667 KBytes
2017-12-19:  - - - - - - - - - - - - - - - - - - - - - - - - -
2017-12-19:  [ ID] Interval           Transfer     Bandwidth       Retr
2017-12-19:  [  4]   0.00-10.00  sec  90.9 MBytes  76.3 Mbits/sec  1052             sender
2017-12-19:  [  4]   0.00-10.00  sec  88.3 MBytes  74.1 Mbits/sec                  receiver
2017-12-19:
2017-12-19:  iperf Done.
```

3 sec
```
[root@ip-172-31-15-69 ~]# iperf3 -c 52.89.38.202 -t 3 -T `date +%F`
2017-12-19:  Connecting to host 52.89.38.202, port 5201
2017-12-19:  [  4] local 172.31.15.69 port 41750 connected to 52.89.38.202 port 5201
2017-12-19:  [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
2017-12-19:  [  4]   0.00-1.00   sec  10.1 MBytes  84.8 Mbits/sec  681   1.40 MBytes
2017-12-19:  [  4]   1.00-2.00   sec  20.0 MBytes   168 Mbits/sec    0   1.50 MBytes
2017-12-19:  [  4]   2.00-3.00   sec  21.2 MBytes   178 Mbits/sec    0   1.51 MBytes
2017-12-19:  - - - - - - - - - - - - - - - - - - - - - - - - -
2017-12-19:  [ ID] Interval           Transfer     Bandwidth       Retr
2017-12-19:  [  4]   0.00-3.00   sec  51.4 MBytes   144 Mbits/sec  681             sender
2017-12-19:  [  4]   0.00-3.00   sec  50.0 MBytes   140 Mbits/sec                  receiver
2017-12-19:
2017-12-19:  iperf Done.
```
```
Server listening on 5201
-----------------------------------------------------------
Accepted connection from 18.216.22.139, port 41748
[  5] local 172.31.7.232 port 5201 connected to 18.216.22.139 port 41750
[ ID] Interval           Transfer     Bandwidth
[  5]   0.00-1.00   sec  6.83 MBytes  57.3 Mbits/sec
[  5]   1.00-2.00   sec  20.7 MBytes   174 Mbits/sec
[  5]   2.00-3.00   sec  20.9 MBytes   176 Mbits/sec
[  5]   3.00-3.07   sec  1.49 MBytes   182 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  5]   0.00-3.07   sec  0.00 Bytes  0.00 bits/sec                  sender
[  5]   0.00-3.07   sec  50.0 MBytes   137 Mbits/sec                  receiver
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
```


-V
```
[root@ip-172-31-15-69 ~]# iperf3 -c 52.89.38.202 -t 3 -T `date +%F` -V
2017-12-19:  iperf 3.1.7
2017-12-19:  2017-12-19:  Linux ip-172-31-15-69 4.9.62-10.57.amzn2.x86_64 #1 SMP Wed Dec 6 00:07:49 UTC 2017 x86_64
Control connection MSS 1448
2017-12-19:  Time: Tue, 19 Dec 2017 08:25:22 GMT
2017-12-19:  Connecting to host 52.89.38.202, port 5201
2017-12-19:        Cookie: ip-172-31-15-69.1513671922.079718.52
2017-12-19:        TCP MSS: 1448 (default)
2017-12-19:  [  4] local 172.31.15.69 port 41754 connected to 52.89.38.202 port 5201
2017-12-19:  Starting Test: protocol: TCP, 1 streams, 131072 byte blocks, omitting 0 seconds, 3 second test
2017-12-19:  [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
2017-12-19:  [  4]   0.00-1.00   sec  2.94 MBytes  24.7 Mbits/sec   97    256 KBytes
2017-12-19:  [  4]   1.00-2.00   sec  3.54 MBytes  29.7 Mbits/sec    0    283 KBytes
2017-12-19:  [  4]   2.00-3.00   sec  3.98 MBytes  33.4 Mbits/sec    0    297 KBytes
2017-12-19:  - - - - - - - - - - - - - - - - - - - - - - - - -
2017-12-19:  Test Complete. Summary Results:
2017-12-19:  [ ID] Interval           Transfer     Bandwidth       Retr
2017-12-19:  [  4]   0.00-3.00   sec  10.5 MBytes  29.2 Mbits/sec   97             sender
2017-12-19:  [  4]   0.00-3.00   sec  9.19 MBytes  25.7 Mbits/sec                  receiver
2017-12-19:  CPU Utilization: local/sender 4.3% (0.2%u/4.0%s), remote/receiver 0.0% (0.0%u/0.0%s)
2017-12-19:  snd_tcp_congestion cubic
2017-12-19:  rcv_tcp_congestion cubic
2017-12-19:
2017-12-19:  iperf Done.
```
