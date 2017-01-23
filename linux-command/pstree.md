```
$ pstree
init─┬─agetty
     ├─amazon-ssm-agen───8*[{amazon-ssm-agen}]
     ├─atd
     ├─auditd───{auditd}
     ├─crond
     ├─dbus-daemon
     ├─2*[dhclient]
     ├─dockerd─┬─docker-containe───7*[{docker-containe}]
     │         └─10*[{dockerd}]
     ├─httpd─┬─httpd───17*[{httpd}]
     │       └─4*[httpd───{httpd}]
     ├─irqbalance
     ├─master─┬─pickup
     │        └─qmgr
     ├─6*[mingetty]
     ├─ntpd
     ├─rngd
     ├─rpc.statd
     ├─rpcbind
     ├─rsyslogd───3*[{rsyslogd}]
     ├─sshd───sshd───sshd───bash───pstree
     └─udevd───2*[udevd]
```

```
$ pstree -p
init(1)─┬─agetty(2707)
        ├─amazon-ssm-agen(2232)─┬─{amazon-ssm-agen}(2243)
        │                       ├─{amazon-ssm-agen}(2245)
        │                       ├─{amazon-ssm-agen}(2246)
        │                       ├─{amazon-ssm-agen}(2247)
        │                       ├─{amazon-ssm-agen}(2248)
        │                       ├─{amazon-ssm-agen}(2249)
        │                       ├─{amazon-ssm-agen}(2267)
        │                       └─{amazon-ssm-agen}(3648)
        ├─atd(2598)
        ├─auditd(2240)───{auditd}(2241)
        ├─crond(2579)
        ├─dbus-daemon(2362)
        ├─dhclient(2072)
        ├─dhclient(2192)
        ├─dockerd(2629)─┬─docker-containe(2636)─┬─{docker-containe}(2637)
        │               │                       ├─{docker-containe}(2638)
        │               │                       ├─{docker-containe}(2639)
        │               │                       ├─{docker-containe}(2640)
        │               │                       ├─{docker-containe}(2641)
        │               │                       ├─{docker-containe}(2642)
        │               │                       └─{docker-containe}(2877)
        │               ├─{dockerd}(2632)
        │               ├─{dockerd}(2633)
        │               ├─{dockerd}(2634)
        │               ├─{dockerd}(2635)
        │               ├─{dockerd}(2652)
        │               ├─{dockerd}(2653)
        │               ├─{dockerd}(2654)
        │               ├─{dockerd}(2656)
        │               ├─{dockerd}(2657)
        │               └─{dockerd}(2658)
        ├─httpd(14801)─┬─httpd(4016)─┬─{httpd}(4019)
        │              │             ├─{httpd}(4023)
        │              │             ├─{httpd}(4024)
        │              │             ├─{httpd}(4025)
        │              │             ├─{httpd}(4026)
        │              │             ├─{httpd}(4027)
        │              │             ├─{httpd}(4028)
        │              │             ├─{httpd}(4029)
        │              │             ├─{httpd}(4030)
        │              │             ├─{httpd}(4031)
        │              │             ├─{httpd}(4032)
        │              │             ├─{httpd}(4033)
        │              │             ├─{httpd}(4034)
        │              │             ├─{httpd}(4035)
        │              │             ├─{httpd}(4036)
        │              │             ├─{httpd}(4037)
        │              │             └─{httpd}(4038)
        │              ├─httpd(4017)───{httpd}(4040)
        │              ├─httpd(4018)───{httpd}(4021)
        │              ├─httpd(4020)───{httpd}(4039)
        │              └─httpd(4022)───{httpd}(4041)
        ├─irqbalance(2283)
        ├─master(31819)─┬─pickup(7355)
        │               └─qmgr(31822)
        ├─mingetty(2709)
        ├─mingetty(2717)
        ├─mingetty(2719)
        ├─mingetty(2722)
        ├─mingetty(2725)
        ├─mingetty(2728)
        ├─ntpd(2502)
        ├─rngd(2292)
        ├─rpc.statd(2331)
        ├─rpcbind(2310)
        ├─rsyslogd(2269)─┬─{rsyslogd}(2270)
        │                ├─{rsyslogd}(2271)
        │                └─{rsyslogd}(2272)
        ├─sshd(2492)───sshd(7410)───sshd(7412)───bash(7413)───pstree(7468)
        └─udevd(1554)─┬─udevd(2679)
                      └─udevd(2685)
```
