#pgrep

###ps

```bash
ps aux |grep httpd
root      2722  0.0  0.3 205880  4032 ?        Ss   Dec16   0:02 /usr/sbin/httpd
apache    2724  0.0  0.3 205880  3724 ?        S    Dec16   0:00 /usr/sbin/httpd
apache    2725  0.0  0.3 205880  3948 ?        S    Dec16   0:00 /usr/sbin/httpd
apache    2726  0.0  0.3 205880  3940 ?        S    Dec16   0:00 /usr/sbin/httpd
apache    2727  0.0  0.3 205880  3728 ?        S    Dec16   0:00 /usr/sbin/httpd
apache    2728  0.0  0.3 205880  4032 ?        S    Dec16   0:00 /usr/sbin/httpd
apache    2991  0.0  0.3 205880  3940 ?        S    Dec16   0:00 /usr/sbin/httpd
apache    2997  0.0  0.3 205880  3728 ?        S    Dec16   0:00 /usr/sbin/httpd
apache    2999  0.0  0.2 205880  2992 ?        S    Dec16   0:00 /usr/sbin/httpd
apache    3000  0.0  0.3 205880  3232 ?        S    Dec16   0:00 /usr/sbin/httpd
root     30162  0.0  0.0 110284   840 pts/0    S+   07:13   0:00 grep httpd
```
###pgrep
```bash
 pgrep -l -f httpd
2722 /usr/sbin/httpd
2724 /usr/sbin/httpd
2725 /usr/sbin/httpd
2726 /usr/sbin/httpd
2727 /usr/sbin/httpd
2728 /usr/sbin/httpd
2991 /usr/sbin/httpd
2997 /usr/sbin/httpd
2999 /usr/sbin/httpd
3000 /usr/sbin/httpd
```
pgrep will exclude process of grep

##example
```bash
pgrep -u root -n -l
25783 rsyslogd
```
select the newest of the matching processes of root user


```bash
ps -fp $(pgrep -d, -x httpd)
UID        PID  PPID  C STIME TTY          TIME CMD
root      2722     1  0 Dec16 ?        00:00:02 /usr/sbin/httpd
apache    2724  2722  0 Dec16 ?        00:00:00 /usr/sbin/httpd
apache    2725  2722  0 Dec16 ?        00:00:00 /usr/sbin/httpd
apache    2726  2722  0 Dec16 ?        00:00:00 /usr/sbin/httpd
apache    2727  2722  0 Dec16 ?        00:00:00 /usr/sbin/httpd
apache    2728  2722  0 Dec16 ?        00:00:00 /usr/sbin/httpd
apache    2991  2722  0 Dec16 ?        00:00:00 /usr/sbin/httpd
apache    2997  2722  0 Dec16 ?        00:00:00 /usr/sbin/httpd
apache    2999  2722  0 Dec16 ?        00:00:00 /usr/sbin/httpd
apache    3000  2722  0 Dec16 ?        00:00:00 /usr/sbin/httpd
```
Show detailed infomation of httpd processes. 

##options

- -d delimiter Sets the string used to delimit each process ID in the output(by default a newline).
- -f filtter of the pattern
- -l list the process name as well as the process ID
- -n newest process.
- -o oldest process.
- -u effective user ID.
- -U real user ID.
- -v Negates the matching


reference http://linuxjm.sourceforge.jp/html/procps/man1/pgrep.1.html
