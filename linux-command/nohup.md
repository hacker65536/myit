

shell script
--------------------

sleep.sh
```bash
#!/bin/bash


for i in `seq 1 5`
do

sleep 20
date

done
```

examples 1
----------------

pts/0
```bash
$ tty
/dev/pts/0
$ ps
  PID TTY          TIME CMD
 3372 pts/0    00:00:00 bash
 3403 pts/0    00:00:00 ps
$ pstree -s 3372 -p
init(1)───sshd(2458)───sshd(3369)───sshd(3371)───bash(3372)───pstree(3405)
```


pts/1
```bash
$ tty
/dev/pts/1
$ ps
  PID TTY          TIME CMD
 3409 pts/1    00:00:00 bash
 3440 pts/1    00:00:00 ps
$ pstree -s 3409 -p
init(1)───sshd(2458)───sshd(3406)───sshd(3408)───bash(3409)───pstree(3441)

```


pstree of sshd
```
$ pstree -s 2458 -p
init(1)───sshd(2458)─┬─sshd(3369)───sshd(3371)───bash(3372)───pstree(3443)
                     └─sshd(3406)───sshd(3408)───bash(3409)
```


execute sh from pts/1
```
$ sh sleep.sh &
[1] 3466


$ pstree -s 2458 -p
init(1)───sshd(2458)─┬─sshd(3369)───sshd(3371)───bash(3372)
                     └─sshd(3406)───sshd(3408)───bash(3409)─┬─pstree(3478)
                                                            └─sh(3466)───sleep(3477)
```

use nohup from pts/1
```
$ nohup sh sleep.sh >nohup.out 2>&1 &
[1] 3529
$ pstree -s 2458 -p
init(1)───sshd(2458)─┬─sshd(3369)───sshd(3371)───bash(3372)
                     └─sshd(3406)───sshd(3408)───bash(3409)─┬─pstree(3532)
                                                            └─sh(3529)───sleep(3531)
$ exit
```

show ps from pts/0
```
$ pstree -s 2458 -p
init(1)───sshd(2458)───sshd(3369)───sshd(3371)───bash(3372)───pstree(3535)


$ pstree -s 3529 -p
init(1)───sh(3529)───sleep(3540)
```



example 2
----------------

### send SIGHUP to sshd

pts/1
```
$ pstree -p -s 2458
init(1)───sshd(2458)─┬─sshd(3369)───sshd(3371)───bash(3372)
                     └─sshd(3602)───sshd(3604)───bash(3605)───pstree(3635)
$ nohup sh sleep.sh >nohup.out 2>&1 &
[1] 3636
```

pts/0
```
$ sudo kill -1 3602
$ pstree -p -s 3636
init(1)───sh(3636)───sleep(3642)
$ pstree -p -s 2458
init(1)───sshd(2458)───sshd(3369)───sshd(3371)───bash(3372)───pstree(3653)
```


### send SIGHUP to ps

pts/1
```
$ sh sleep.sh  &
[1] 3751
```

pts/0
```
$ pstree -p -s 2458
init(1)───sshd(2458)─┬─sshd(3369)───sshd(3371)───bash(3372)───pstree(3754)
                     └─sshd(3700)───sshd(3702)───bash(3703)───sh(3751)───sleep(3753)
$ sudo kill -1 3751
$ pstree -p -s 2458
init(1)───sshd(2458)─┬─sshd(3369)───sshd(3371)───bash(3372)───pstree(3757)
                     └─sshd(3700)───sshd(3702)───bash(3703)
```



### send SIGHUP to ps of nohup

pts/1
```
$ nohup sh sleep.sh >nohup.out 2>&1 &
[1] 3733
```


pts/0
```
$ pstree -p -s 2458
init(1)───sshd(2458)─┬─sshd(3369)───sshd(3371)───bash(3372)───pstree(3738)
                     └─sshd(3700)───sshd(3702)───bash(3703)───sh(3733)───sleep(3735)

$ sudo kill -1 3733
$ pstree -p -s 2458
init(1)───sshd(2458)─┬─sshd(3369)───sshd(3371)───bash(3372)───pstree(3743)
                     └─sshd(3700)───sshd(3702)───bash(3703)───sh(3733)───sleep(3740)
```
