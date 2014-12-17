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
