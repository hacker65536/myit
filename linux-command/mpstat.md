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
