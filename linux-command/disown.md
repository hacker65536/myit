

Continued from nohup(./nohup.md)

pts/1
```
$ sh sleep.sh > nohup.out 2>&1
^Z
[1]+  Stopped                 sh sleep.sh > nohup.out 2>&1
$ bg %1
[1]+ sh sleep.sh > nohup.out 2>&1 &
$ disown %1

```

pts/0
```
$ pstree -p -s 2458
init(1)───sshd(2458)─┬─sshd(3369)───sshd(3371)───bash(3372)───pstree(4093)
                     └─sshd(3780)───sshd(3782)───bash(3785)───sh(4085)───sleep(4089)
$ sudo kill 1 3780
$ pstree -p -s 4085
init(1)───sh(4085)───sleep(4099)
```
