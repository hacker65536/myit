#ps
report a snapshot of the current processes.

>This version of ps accepts several kinds of options:
>- 1   UNIX options, which may be grouped and must be preceded by a dash.
>- 2   BSD options, which may be grouped and must not be used with a dash.
>- 3   GNU long options, which are preceded by two dashes.

##option

a
- Lift the BSD-style "only yourself" restriction, which is imposed upon the set of all
processes when some BSD-style (without "-") options are used or when the ps
personality setting is BSD-like. The set of processes selected in this manner is in
addition to the set of processes selected by other means. An alternate description
is that this option causes ps to list all processes with a terminal (tty), or to
list all processes when used together with the x option.

##examples

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
##tips
```bash
 ps auxfe|head -5
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         2  0.0  0.0      0     0 ?        S    Feb10   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        S    Feb10   0:00  \_ [ksoftirqd/0]
root         5  0.0  0.0      0     0 ?        S<   Feb10   0:00  \_ [kworker/0:0H]
root         6  0.0  0.0      0     0 ?        S    Feb10   0:03  \_ [kworker/u30:0]
```

```bash
 ps auxf|head -5
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         2  0.0  0.0      0     0 ?        S    Feb10   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        S    Feb10   0:00  \_ [ksoftirqd/0]
root         5  0.0  0.0      0     0 ?        S<   Feb10   0:00  \_ [kworker/0:0H]
root         6  0.0  0.0      0     0 ?        S    Feb10   0:03  \_ [kworker/u30:0]
```
