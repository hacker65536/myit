```
$ ps f
  PID TTY      STAT   TIME COMMAND
31477 pts/1    Ss     0:00 -bash
31505 pts/1    R+     0:00  \_ ps f
```

```
$ for i in {1..5}; do { sleep 5 & } ; done
[1] 31506
[2] 31507
[3] 31508
[4] 31509
[5] 31510
```

```
$ ps f
  PID TTY      STAT   TIME COMMAND
31477 pts/1    Ss     0:00 -bash
31506 pts/1    S      0:00  \_ sleep 5
31507 pts/1    S      0:00  \_ sleep 5
31508 pts/1    S      0:00  \_ sleep 5
31509 pts/1    S      0:00  \_ sleep 5
31510 pts/1    S      0:00  \_ sleep 5
31511 pts/1    R+     0:00  \_ ps f
```

```
$ for i in {1..5}; do ( sleep 5 & ) ; done
```

```
$ ps f
  PID TTY      STAT   TIME COMMAND
31477 pts/1    Ss     0:00 -bash
31523 pts/1    R+     0:00  \_ ps f
31522 pts/1    S      0:00 sleep 5
31520 pts/1    S      0:00 sleep 5
31518 pts/1    S      0:00 sleep 5
31516 pts/1    S      0:00 sleep 5
31514 pts/1    S      0:00 sleep 5
```


grouping commands
----

https://www.gnu.org/software/bash/manual/html_node/Command-Grouping.html#Command-Grouping

- ()

Placing a list of commands between parentheses causes a `subshell` environment to be created (see Command Execution Environment), and each of the commands in list to be executed in that subshell. Since the list is executed in a subshell, variable assignments do not remain in effect after the subshell completes.

- {}

Placing a list of commands between curly braces causes the list to be executed in the `current shell` context. No subshell is created. The semicolon (or newline) following list is required.

wait
----

Description
>All of these system calls are used to wait for state changes in a
       child of the calling process, and obtain information about the child
       whose state has changed.
