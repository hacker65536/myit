
sleep.sh
```bash
#!/bin/bash


for i in `seq 1 5`
do

sleep 20
date

done
```

pts/0
```bash
]$ tty
/dev/pts/0
$ ps
  PID TTY          TIME CMD
30514 pts/0    00:00:00 bash
30566 pts/0    00:00:00 ps

```


pts/2
```bash
$ tty
/dev/pts/2
$ ps
  PID TTY          TIME CMD
30573 pts/2    00:00:00 bash
30604 pts/2    00:00:00 ps
```


