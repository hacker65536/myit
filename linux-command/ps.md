# ps
report a snapshot of the current processes.

>This version of ps accepts several kinds of options:
>- 1   UNIX options, which may be grouped and must be preceded by a dash.
>- 2   BSD options, which may be grouped and must not be used with a dash.
>- 3   GNU long options, which are preceded by two dashes.

## option

### SIMPLE PROCESS SELECTION
a
- Lift the BSD-style "only yourself" restriction, which is imposed upon the set of all
processes when some BSD-style (without "-") options are used or when the ps
personality setting is BSD-like. The set of processes selected in this manner is in
addition to the set of processes selected by other means. An alternate description
is that this option causes ps to list all processes with a terminal (tty), or to
list all processes when used together with the x option.  

x
- Lift the BSD-style "must have a tty" restriction, which is imposed upon the set of
all processes when some BSD-style (without "-") options are used or when the ps
personality setting is BSD-like. The set of processes selected in this manner is in
addition to the set of processes selected by other means. An alternate description
is that this option causes ps to list all processes owned by you (same EUID as ps),
or to list all processes when used together with the a option.

T
- Select all processes associated with this terminal. Identical to the t option without any argument.

### PROCESS SELECTION BY LIST
These options accept a single argument in the form of a blank-separated or comma-separated list. They can be used multiple times. For example: ps -p "1 2" -p 3,4

-C cmdlist
- Select by command name. this selects the processes whose executable name is given in cmdlist.

U,-u,--user userlist
- Select by effective user ID(EUID) or name. This selects the processes whose effective user name or ID is in userlist. the effective user ID describes the user whose file access permissions are userd by the process (see geteuid(2)).

p,-p,--pid pidlist
- Select by process ID

q,-q,--quick-pid pidlist
- Quick select by process ID.

-s sesslist
- Select by session ID.

t,-t,--tty
- Select by tty. Nearly identical to -t and --ty, but can also be used with an empty ttylist to indicate the terminal associated with ps. Using the T option is considered cleaner than using T with an empty ttylist.

-123
- Identical to --sid 123.

123
- Identical to --pid 123.

### OUTPUT FORMAT CONTROL
These options are used to choose the information displayed by ps. The output may differ by personality.

- -F extra full format. See the -f option, which -F implies.
- X Register format.
- Z,-M Add a column of security data. Identical to -M. (for SE Linux)
- j,-j (BSD) job control format.
- -l long format. The -y option is often useful with this.
- u display user-oriented format
- v display virtual memory format

### OUTPUT MODIFIERS

-H
- Show process hierarchy(forest)

f
- ASCII-art process hierarchy(forest)

e
- Show the environment after the command.

w,-w
- Wide output. Use this option twice for unlimited width.

### THREAD DISPLAY
H
- Show threads as if they were processes

-L
- Show threads, possibly with LWP and NLWP columns

-T
- Show threads, possibly with SPID column

m,-m
- Show threads after processes

### PROCESS STATE CODES
Here are the different values that the s, stat and state output specifiers (header "STAT" or "S") will display to describe the state of a process.

D
- Uninterruptible sleep(usually IO)

R
- Runnning or ruunable (on run queue)

S
- Interruptible sleep(wating for an event to complete)

T
- Sttoped, either by a job control signal or because it is being traced.

W
- Paging(not valid since the 2.6.xx kernel)

X
- dead (should never be seen)

Z
- Defunct("zombie") process, terminated but not reaped by its parent.

For BSD formats and when the stat keyword is used, additional characters may be displayed:

<
- high-priority (not nice to other users)  

N
- low-priority(nice to other users)  

L
- has pages locked into memory ( for real-time and custom IO)

s
- is a session leader

l
- is multi-threaded(using CLONE_THREAD, like NPTL pthreads do)  

+
- is in the foreground process group

## examples

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
## tips
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
