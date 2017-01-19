

```
[root@ip-172-31-18-92 ~]# dstat -Tclmdrn
--epoch--- ----total-cpu-usage---- ---load-avg--- ------memory-usage----- -dsk/total- --io/total- -net/total-
  epoch   |usr sys idl wai hiq siq| 1m   5m  15m | used  buff  cach  free| read  writ| read  writ| recv  send
1484814273|  0   0 100   0   0   0|   0    0    0| 131M  106M  391M 3327M|1037B 1299B|0.03  0.15 |   0     0
1484814274|  0   0 100   0   0   0|   0    0    0| 131M  106M  391M 3327M|   0     0 |   0     0 | 104B 1158B
1484814275|  0   0 100   0   0   0|   0    0    0| 131M  106M  391M 3327M|   0     0 |   0     0 |  52B  454B
1484814276|  0   0 100   0   0   0|   0    0    0| 131M  106M  391M 3327M|   0     0 |   0     0 |4631B 3288B
1484814277|  0   0 100   0   0   0|   0    0    0| 131M  106M  391M 3327M|   0     0 |   0     0 |  52B  454B
```

```
yum info dstat
Loaded plugins: priorities, update-motd, upgrade-helper
Installed Packages
Name        : dstat
Arch        : noarch
Version     : 0.7.0
Release     : 1.7.amzn1
Size        : 657 k
Repo        : installed
From repo   : amzn-main
Summary     : Versatile resource statistics tool
URL         : http://dag.wieers.com/home-made/dstat/
License     : GPLv2
Description : Dstat is a versatile replacement for vmstat, iostat, netstat and ifstat.
            : Dstat overcomes some of their limitations and adds some extra features,
            : more counters and flexibility. Dstat is handy for monitoring systems
            : during performance tuning tests, benchmarks or troubleshooting.
            :
            : Dstat allows you to view all of your system resources instantly, you
            : can eg. compare disk usage in combination with interrupts from your
            : IDE controller, or compare the network bandwidth numbers directly
            : with the disk throughput (in the same interval).
            :
            : Dstat gives you detailed selective information in columns and clearly
            : indicates in what magnitude and unit the output is displayed. Less
            : confusion, less mistakes.
``` 
