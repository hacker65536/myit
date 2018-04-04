

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


-t --time enable time/date output
```
# dstat -t
----system----
  date/time
04-04 01:20:41
04-04 01:20:42
04-04 01:20:43
```

-c --cpu user ,system, idle, wait, hardware interrupt, software interrupt
```
# dstat -c
----total-cpu-usage----
usr sys idl wai hiq siq
  0   0  97   3   0   0
  0   0 100   0   0   0
  0   0 100   0   0   0
  0   0 100   0   0   0
  0   0 100   0   0   0
 ```
 
 -m --mem enable memory stats (userd, buffers, cache, free)
 ```
 # dstat -m
------memory-usage-----
 used  buff  cach  free
 135M 19.5M 42.6M 3444M
 135M 19.5M 42.6M 3444M
 135M 19.5M 42.6M 3444M
 135M 19.5M 42.6M 3444M
```

--vm   enable vm stats (hard pagefaults, soft pagefaults, allocated, free)
```
# dstat -vm
---procs--- ------memory-usage----- ---paging-- -dsk/total- ---system-- ----total-cpu-usage---- ------memory-usage-----
run blk new| used  buff  cach  free|  in   out | read  writ| int   csw |usr sys idl wai hiq siq| used  buff  cach  free
  0   0 0.1| 135M 19.6M 42.6M 3444M|   0     0 |4456B 4067k|  38    72 |  0   0  97   3   0   0| 135M 19.6M 42.6M 3444M
  0   0   0| 135M 19.6M 42.6M 3444M|   0     0 |   0     0 |  23    12 |  0   0 100   0   0   0| 135M 19.6M 42.6M 3444M
  0   0   0| 135M 19.6M 42.6M 3444M|   0     0 |   0     0 |  14     8 |  0   0 100   0   0   0| 135M 19.6M 42.6M 3444M
  0   0   0| 135M 19.6M 42.6M 3444M|   0     0 |   0     0 |  18    13 |  0   0 100   0   0   0| 135M 19.6M 42.6M 3444M
  0   0   0| 135M 19.6M 42.6M 3444M|   0     0 |   0     0 |  15    11 |  0   0 100   0   0   0| 135M 19.6M 42.6M 3444M
  0   0   0| 135M 19.6M 42.6M 3444M|   0     0 |   0    40k|  22    18 |  0   0 100   0   0   0| 135M 19.6M 42.6M 3444M
  0   0   0| 135M 19.6M 42.6M 3444M|   0     0 |   0     0 |  15     8 |  0   0 100   0   0   0| 135M 19.6M 42.6M 3444M
```

-s  --swap  enable swap stats (used, free)
```
# dstat -s
----swap---
 used  free
   0     0
   0     0
   0     0
   0     0
   0     0 
```


-g --page enable page stats(page in, page out)
```
# dstat -g
---paging--
  in   out
   0     0
   0     0
   0     0
   0     0 
```

-d --disk enable dis stats (read,write)
```
# dstat -d
-dsk/total-
 read  writ
4443B 4056k
   0     0
   0     0
   0    56k
   0     0
   0     0 
```

