
require VPC DNS hostnames:yes

```bash
hostname
ip-10-3-0-225
```
```resolv
cat /etc/resolv.conf
options timeout:2 attempts:5
; generated by /sbin/dhclient-script
search ap-northeast-1.compute.internal
nameserver 10.3.0.2
```


```bash
dig $(hostname) +search +short
10.3.0.225
```

