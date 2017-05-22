
```bash
nice -n 19 sleep 10 &
^19^10
```

```bash
ps  o uid,pid,ni,stat,command --sort -ni
  UID   PID  NI STAT COMMAND
 1000  2578  19 SN   sleep 10
 1000  2579  10 SN   sleep 10
 1000  1355   0 Ss   -bash
 1000  2580   0 R+   ps o uid,pid,ni,stat,command --sort -ni
```

```bash
```
