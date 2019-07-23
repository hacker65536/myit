top
===============
```
top
```

command line option
---------------------

delay (* 'd' - Delay time       3.0 seconds)
```
$ top -d <sec>
```

```
$ top -u apache

Tasks: 105 total,   1 running, 103 sleeping,   1 stopped,   0 zombie
Cpu(s):  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   4049856k total,   721244k used,  3328612k free,   137356k buffers
Swap:        0k total,        0k used,        0k free,   447560k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
 4016 apache    20   0  581m  13m 6876 S  0.0  0.3   0:19.33 httpd
 4017 apache    20   0  389m  13m 6876 S  0.0  0.3   0:18.00 httpd
 4018 apache    20   0  389m  13m 6876 S  0.0  0.3   0:18.11 httpd
 4020 apache    20   0  389m  13m 6876 S  0.0  0.3   0:18.07 httpd
 4022 apache    20   0  389m  13m 6876 S  0.0  0.3   0:18.06 httpd
```

show fullpath
```
$ top -c

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
    1 root      20   0 19636 2616 2292 S  0.0  0.3   0:00.96 /sbin/init
```
```
  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
    1 root      20   0 19636 2616 2292 S  0.0  0.3   0:00.96 init
```



INTERACTIVE Commands
---------------------

### GLOBAL Commands
* d change delay
* k kill process
* u select a user
* B bold toggle
* A Alternate_Display_mode toggle

### SUMMARY Area Commands
* l load_average/uptime toggle
* m memory/swap_usage toggle
* t Task/Cpu_state toggle
* 1 single/sparate_cpu_state toggle




`shift+O`


`add filter #1 (case sensitive) as: [!]FLD?VAL` + `COMMAND=vim`

```
top - 09:08:14 up  2:31,  2 users,  load average: 0.00, 0.00, 0.00
Tasks:  94 total,   1 running,  54 sleeping,   1 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  5086264 total,  4251208 free,   162764 used,   672292 buff/cache
KiB Swap:        0 total,        0 free,        0 used.  4662408 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 4882 ec2-user  20   0  146112   9256   5032 T   0.0  0.2   0:00.24 vim ec2.tf
 6164 ec2-user  20   0  145528   8648   5096 S   0.0  0.2   0:00.05 vim alb.tf
 ```
