https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-time.html

```console
$ yum install chrony
```


```
[root@ip-172-31-38-84 ~]# chronyc sources
210 Number of sources = 4
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^- ntp-ext.cosng.net             2   6    17    35  +2559us[+1355us] +/-  109ms
^- services.quadranet.com        3   6    17    35    +25ms[  +25ms] +/-  131ms
^- ns.tx.primate.net             2   6    17    35  +2692us[+2692us] +/-   83ms
^* ntp.your.org                  1   6    17    36  -8503ns[-1213us] +/-   12ms
```
