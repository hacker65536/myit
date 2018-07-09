

http://www.ex-parrot.com/pdw/iftop/


```console
$ sudo yum install -y --enablerepo=epel iftop
```

```console
sudo iftop -i eth0 -B -P -n -N
```

text mode
```console
$ sudo iftop -i eth0 -B -P -n -N -t
interface: eth0
IP address is: 172.31.42.21
MAC address is: 0a:18:fa:ff:75:36
Listening on eth0
   # Host name (port/service if enabled)            last 2s   last 10s   last 40s cumulative
--------------------------------------------------------------------------------------------
   1 172.31.42.21:22                          =>        60B        60B        60B       120B
     xx.xx.xx.xxx:44504                       <=        60B        60B        60B       120B
--------------------------------------------------------------------------------------------
Total send rate:                                        60B        60B        60B
Total receive rate:                                     60B        60B        60B
Total send and receive rate:                           120B       120B       120B
--------------------------------------------------------------------------------------------
Peak rate (sent/received/total):                        60B        60B       120B
Cumulative (sent/received/total):                      120B       120B       240B
============================================================================================
```

option
----

- -h print a summary of usage.
- -n Don't do hostname lookups.
- -N Do not resolve port number to service names
- -p Run in promiscuous mode, so that traffic which does not pass directly through the specified interface is also counted.
- -P Turn on port display.
- -l Display and count datagrams addressed to or from link-local IPv6 addresses. The default is not to display that address category.
- -b Don't display bar graphs of traffic.
- -m limit set the upper limit for the bandwidth scale. Specified as a number with a 'K' , 'M' or 'G' suffix
- -B Display bandwidth rates in bytes/sec rather than bits/sec.
- -i interface Listen to packets on interface.
- -f filter code
- -F net/mask
- -G net6/mask6
- -c config file
- -t text output mode

ref  

http://kenzo0107.hatenablog.com/entry/2017/11/08/233055  
https://qiita.com/hana_shin/items/bbf8e2f705d0237874b3  
