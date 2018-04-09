
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

grouping
--------
```
$ date; seq 5 10 | xargs -L 1 -P 10 -IS sh -c 'echo $(date) start S; sleep S;echo $(date) end S'  ;wait; date
Mon Apr  9 05:30:37 UTC 2018
Mon Apr 9 05:30:37 UTC 2018 start 5
Mon Apr 9 05:30:37 UTC 2018 start 10
Mon Apr 9 05:30:37 UTC 2018 start 9
Mon Apr 9 05:30:37 UTC 2018 start 6
Mon Apr 9 05:30:37 UTC 2018 start 8
Mon Apr 9 05:30:37 UTC 2018 start 7
Mon Apr 9 05:30:42 UTC 2018 end 5
Mon Apr 9 05:30:43 UTC 2018 end 6
Mon Apr 9 05:30:44 UTC 2018 end 7
Mon Apr 9 05:30:45 UTC 2018 end 8
Mon Apr 9 05:30:46 UTC 2018 end 9
Mon Apr 9 05:30:47 UTC 2018 end 10
Mon Apr  9 05:30:47 UTC 2018
```


```
$ ps f
  PID TTY      STAT   TIME COMMAND
 5699 pts/2    Ss     0:00 -bash
 5921 pts/2    R+     0:00  \_ ps f
 5670 pts/1    Ss     0:00 -bash
 5896 pts/1    S+     0:00  \_ xargs -L 1 -P 10 -IS sh -c echo $(date) start S; sleep S;echo $(date)
 5897 pts/1    S+     0:00      \_ sh -c echo $(date) start 5; sleep 5;echo $(date) end 5
 5914 pts/1    S+     0:00      |   \_ sleep 5
 5898 pts/1    S+     0:00      \_ sh -c echo $(date) start 6; sleep 6;echo $(date) end 6
 5918 pts/1    S+     0:00      |   \_ sleep 6
 5899 pts/1    S+     0:00      \_ sh -c echo $(date) start 7; sleep 7;echo $(date) end 7
 5920 pts/1    S+     0:00      |   \_ sleep 7
 5900 pts/1    S+     0:00      \_ sh -c echo $(date) start 8; sleep 8;echo $(date) end 8
 5919 pts/1    S+     0:00      |   \_ sleep 8
 5901 pts/1    S+     0:00      \_ sh -c echo $(date) start 9; sleep 9;echo $(date) end 9
 5917 pts/1    S+     0:00      |   \_ sleep 9
 5902 pts/1    S+     0:00      \_ sh -c echo $(date) start 10; sleep 10;echo $(date) end 10
 5916 pts/1    S+     0:00          \_ sleep 10
```
