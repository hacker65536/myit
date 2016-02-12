#ps
report a snapshot of the current processes.

#examples

to see every process on the system using standard syntax:

```bash
ps -e 
ps -ef 
ps -eF
ps -ely
```
to see every process on the system using BSD syntax:

```bash
ps ax
ps axu
```

to print a process tree:
```bash
ps -ejH
ps axjf
```

to get securtity info:
```bash
ps -eo euser,ruser,suser,fuser,f,comm,label
ps axZ
ps -eM
```

to see every process running as root (real & effective ID) in user format:
```bash
ps -U root -u root u
```
