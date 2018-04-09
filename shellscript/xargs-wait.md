
normal
-------
```
$ time seq 1 5 | xargs sleep

real    0m15.002s
user    0m0.000s
sys     0m0.000s
```

```
$ ps f
  PID TTY      STAT   TIME COMMAND
 5699 pts/2    Ss     0:00 -bash
 5729 pts/2    R+     0:00  \_ ps f
 5670 pts/1    Ss     0:00 -bash
 5727 pts/1    S+     0:00  \_ xargs sleep
 5728 pts/1    S+     0:00      \_ sleep 1 2 3 4 5
```

specify max-line and max-procs
-------
```
$ time seq 5 10 | xargs -L 1 -P 10 -IS sleep S

real    0m10.002s
user    0m0.000s
sys     0m0.000s
```


```
$ ps f
  PID TTY      STAT   TIME COMMAND
 5699 pts/2    Ss     0:00 -bash
 5742 pts/2    R+     0:00  \_ ps f
 5670 pts/1    Ss     0:00 -bash
 5735 pts/1    S+     0:00  \_ xargs -L 1 -P 10 -IS sleep S
 5736 pts/1    S+     0:00      \_ sleep 5
 5737 pts/1    S+     0:00      \_ sleep 6
 5738 pts/1    S+     0:00      \_ sleep 7
 5739 pts/1    S+     0:00      \_ sleep 8
 5740 pts/1    S+     0:00      \_ sleep 9
 5741 pts/1    S+     0:00      \_ sleep 10
```

using wait
-------
```
$ date; seq 5 10 | xargs -L 1 -P 10 -IS sleep S ;wait; date
Mon Apr  9 05:21:35 UTC 2018
Mon Apr  9 05:21:45 UTC 2018
```
