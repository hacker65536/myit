```
$ mpstat -P ALL
Linux 4.9.17-8.31.amzn1.x86_64 (ip-172-31-4-24) 	04/17/2017 	_x86_64_	(1 CPU)

03:13:41 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
03:13:41 PM  all    0.01    0.00    0.00    0.01    0.00    0.00    0.00    0.00   99.98
03:13:41 PM    0    0.01    0.00    0.00    0.01    0.00    0.00    0.00    0.00   99.98
```


```
$ mpstat -P ALL 3
Linux 4.9.17-8.31.amzn1.x86_64 (ip-172-31-4-24) 	04/17/2017 	_x86_64_	(1 CPU)

03:14:51 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
03:14:54 PM  all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
03:14:54 PM    0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

03:14:54 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
03:14:57 PM  all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
03:14:57 PM    0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

03:14:57 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
03:15:00 PM  all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
03:15:00 PM    0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
```

```
$ mpstat -P ALL 1 3
Linux 4.9.17-8.31.amzn1.x86_64 (ip-172-31-4-24) 	04/17/2017 	_x86_64_	(1 CPU)

03:17:28 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
03:17:29 PM  all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
03:17:29 PM    0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

03:17:29 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
03:17:30 PM  all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
03:17:30 PM    0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

03:17:30 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
03:17:31 PM  all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
03:17:31 PM    0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
Average:     all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
Average:       0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
```


```
$ mpstat -A
Linux 4.9.17-8.31.amzn1.x86_64 (ip-172-31-4-24) 	04/17/2017 	_x86_64_	(1 CPU)

03:19:25 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
03:19:25 PM  all    0.01    0.00    0.00    0.01    0.00    0.00    0.00    0.00   99.98
03:19:25 PM    0    0.01    0.00    0.00    0.01    0.00    0.00    0.00    0.00   99.98

03:19:25 PM  CPU    intr/s
03:19:25 PM  all      4.73
03:19:25 PM    0      4.73

03:19:25 PM  CPU        0/s        1/s        4/s        9/s       12/s       14/s       15/s       48/s       49/s       50/s       51/s       52/s       53/s       54/s       55/s       56/s      NMI/s      LOC/s      SPU/s      PMI/s      IWI/s      RTR/s      RES/s      CAL/s      TLB/s      TRM/s      THR/s      DFR/s      MCE/s      MCP/s      HYP/s      ERR/s      MIS/s      PIN/s      PIW/s
03:19:25 PM    0       0.00       0.00       0.00       0.00       0.00       0.00       0.00       4.51       0.00       0.00       0.00       0.00       0.00       0.00       0.14       0.07       0.00       0.00       0.00       0.00       0.00       0.00       0.00       0.00       0.00       0.00       0.00       0.00       0.00       0.00       4.73       0.00       0.00       0.00       0.00
```
