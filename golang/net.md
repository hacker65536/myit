

normal
```
testdb1.xxxxxxxx.us-east-2.rds.amazonaws.com
```

no such host  
```
panic: dial tcp: lookup testdb2.xxxxxxxx.us-east-2.rds.amazonaws.com on 172.31.0.2:53: no such host
```

 172.31.0.2:53 = name server
 
stopped rds
```
panic: dial tcp 172.31.23.191:3306: getsockopt: no route to host
```

change ingress of security group 
```
panic: dial tcp 172.31.23.191:3306: getsockopt: connection timed out

goroutine 1 [running]:
main.check(0x6f1960, 0xc4200d4050)
        /home/ec2-user/sql/main.go:19 +0x86
main.main()
        /home/ec2-user/sql/main.go:35 +0x226
exit status 2

real    2m9.746s
user    0m0.245s
sys     0m0.066s
```

```
# tcpdump -Xn host 172.31.23.191
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 262144 bytes
08:26:39.392835 IP 172.31.22.53.36632 > 172.31.23.191.mysql: Flags [S], seq 452836009, win 26883, options [mss 8961,sackOK,TS val 117700                         4482 ecr 0,nop,wscale 7], length 0
        0x0000:  4500 003c fd2e 4000 ff06 f859 ac1f 1635  E..<..@....Y...5
        0x0010:  ac1f 17bf 8f18 0cea 1afd baa9 0000 0000  ................
        0x0020:  a002 6903 8661 0000 0204 2301 0402 080a  ..i..a....#.....
        0x0030:  4627 a9c2 0000 0000 0103 0307            F'..........
08:26:40.419119 IP 172.31.22.53.36632 > 172.31.23.191.mysql: Flags [S], seq 452836009, win 26883, options [mss 8961,sackOK,TS val 117700                         5509 ecr 0,nop,wscale 7], length 0
        0x0000:  4500 003c fd2f 4000 ff06 f858 ac1f 1635  E..<./@....X...5
        0x0010:  ac1f 17bf 8f18 0cea 1afd baa9 0000 0000  ................
        0x0020:  a002 6903 8661 0000 0204 2301 0402 080a  ..i..a....#.....
        0x0030:  4627 adc5 0000 0000 0103 0307            F'..........
08:26:42.435115 IP 172.31.22.53.36632 > 172.31.23.191.mysql: Flags [S], seq 452836009, win 26883, options [mss 8961,sackOK,TS val 117700                         7525 ecr 0,nop,wscale 7], length 0
        0x0000:  4500 003c fd30 4000 ff06 f857 ac1f 1635  E..<.0@....W...5
        0x0010:  ac1f 17bf 8f18 0cea 1afd baa9 0000 0000  ................
        0x0020:  a002 6903 8661 0000 0204 2301 0402 080a  ..i..a....#.....
        0x0030:  4627 b5a5 0000 0000 0103 0307            F'..........
08:26:44.483114 ARP, Request who-has 172.31.23.191 tell 172.31.22.53, length 28
        0x0000:  0001 0800 0604 0001 0620 60b6 93c0 ac1f  ..........`.....
        0x0010:  1635 0000 0000 0000 ac1f 17bf            .5..........
08:26:44.483144 ARP, Reply 172.31.23.191 is-at 06:17:4e:c4:ae:1a, length 28
        0x0000:  0001 0800 0604 0002 0617 4ec4 ae1a ac1f  ..........N.....
        0x0010:  17bf 0620 60b6 93c0 ac1f 1635            ....`......5
08:26:46.531118 IP 172.31.22.53.36632 > 172.31.23.191.mysql: Flags [S], seq 452836009, win 26883, options [mss 8961,sackOK,TS val 117701                         1621 ecr 0,nop,wscale 7], length 0
        0x0000:  4500 003c fd31 4000 ff06 f856 ac1f 1635  E..<.1@....V...5
        0x0010:  ac1f 17bf 8f18 0cea 1afd baa9 0000 0000  ................
        0x0020:  a002 6903 8661 0000 0204 2301 0402 080a  ..i..a....#.....
        0x0030:  4627 c5a5 0000 0000 0103 0307            F'..........
08:26:54.723116 IP 172.31.22.53.36632 > 172.31.23.191.mysql: Flags [S], seq 452836009, win 26883, options [mss 8961,sackOK,TS val 117701                         9813 ecr 0,nop,wscale 7], length 0
        0x0000:  4500 003c fd32 4000 ff06 f855 ac1f 1635  E..<.2@....U...5
        0x0010:  ac1f 17bf 8f18 0cea 1afd baa9 0000 0000  ................
        0x0020:  a002 6903 8661 0000 0204 2301 0402 080a  ..i..a....#.....
        0x0030:  4627 e5a5 0000 0000 0103 0307            F'..........
08:27:10.851119 IP 172.31.22.53.36632 > 172.31.23.191.mysql: Flags [S], seq 452836009, win 26883, options [mss 8961,sackOK,TS val 117703                         5941 ecr 0,nop,wscale 7], length 0
        0x0000:  4500 003c fd33 4000 ff06 f854 ac1f 1635  E..<.3@....T...5
        0x0010:  ac1f 17bf 8f18 0cea 1afd baa9 0000 0000  ................
        0x0020:  a002 6903 8661 0000 0204 2301 0402 080a  ..i..a....#.....
        0x0030:  4628 24a5 0000 0000 0103 0307            F($.........
08:27:43.363122 IP 172.31.22.53.36632 > 172.31.23.191.mysql: Flags [S], seq 452836009, win 26883, options [mss 8961,sackOK,TS val 1177068452 ecr 0,nop,wscale 7], length 0
        0x0000:  4500 003c fd34 4000 ff06 f853 ac1f 1635  E..<.4@....S...5
        0x0010:  ac1f 17bf 8f18 0cea 1afd baa9 0000 0000  ................
        0x0020:  a002 6903 8661 0000 0204 2301 0402 080a  ..i..a....#.....
        0x0030:  4628 a3a4 0000 0000 0103 0307            F(..........
08:27:48.483116 ARP, Request who-has 172.31.23.191 tell 172.31.22.53, length 28
        0x0000:  0001 0800 0604 0001 0620 60b6 93c0 ac1f  ..........`.....
        0x0010:  1635 0000 0000 0000 ac1f 17bf            .5..........
08:27:48.483149 ARP, Reply 172.31.23.191 is-at 06:17:4e:c4:ae:1a, length 28
        0x0000:  0001 0800 0604 0002 0617 4ec4 ae1a ac1f  ..........N.....
        0x0010:  17bf 0620 60b6 93c0 ac1f 1635            ....`......5
```

```
panic: Error 1205: Lock wait timeout exceeded; try restarting transaction
```
