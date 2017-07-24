
## ファイルを掴んでるプロセスの特定


```bash
# fuser -va /var/log/httpd/access_log
                    USER        PID ACCESS COMMAND
/var/log/httpd/access_log:
                    root      12401 F.... httpd
                    apache    12403 F.... httpd
                    apache    12404 F.... httpd
                    apache    12413 F.... httpd
                    apache    12423 F.... httpd
                    apache    12425 F.... httpd
```

プロセスのみを見る
```bash
# fuser -a /var/log/httpd/access_log
/var/log/httpd/access_log: 12401 12403 12404 12413 12423 12425
```

## プロセス名でプロセスの状況を確認
ヘッダー付けてpsでgrep、grep自体のプロセスを除く(grep -v でも可能)

```bash
# ps axu | grep -e [%]CPU -e [h]ttpd
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root     12401  0.0  0.4 390480 19920 ?        Ss   15:19   0:00 /usr/sbin/httpd
apache   12403  0.0  0.3 595348 13060 ?        Sl   15:19   0:02 /usr/sbin/httpd
apache   12404  0.0  0.3 398676 13060 ?        Sl   15:19   0:02 /usr/sbin/httpd
apache   12413  0.0  0.3 398676 13060 ?        Sl   15:19   0:02 /usr/sbin/httpd
apache   12423  0.0  0.3 398676 13060 ?        Sl   15:19   0:02 /usr/sbin/httpd
apache   12425  0.0  0.3 398676 13060 ?        Sl   15:19   0:02 /usr/sbin/httpd
```
* rootユーザ以外の場合は""つける必要がある ( -e "[h]ttpd")

[]を付けない場合はgrepのプロセスも表示される
```bash
# ps axu | grep -e %CPU -e httpd
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root     12401  0.0  0.4 390480 19920 ?        Ss   15:19   0:00 /usr/sbin/httpd
apache   12403  0.0  0.3 595348 13060 ?        Sl   15:19   0:02 /usr/sbin/httpd
apache   12404  0.0  0.3 398676 13060 ?        Sl   15:19   0:02 /usr/sbin/httpd
apache   12413  0.0  0.3 398676 13060 ?        Sl   15:19   0:02 /usr/sbin/httpd
apache   12423  0.0  0.3 398676 13060 ?        Sl   15:19   0:02 /usr/sbin/httpd
apache   12425  0.0  0.3 398676 13060 ?        Sl   15:19   0:02 /usr/sbin/httpd
ec2-user 13565  0.0  0.0 110460  2036 pts/0    R+   19:29   0:00 grep --color=auto -e %CPU -e httpd
```

tree状で見る場合
```bash
# ps axuf | grep -e [%]CPU -e [h]ttpd
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root     12401  0.0  0.4 390480 19920 ?        Ss   15:19   0:00 /usr/sbin/httpd
apache   12403  0.0  0.3 595348 13060 ?        Sl   15:19   0:02  \_ /usr/sbin/httpd
apache   12404  0.0  0.3 398676 13060 ?        Sl   15:19   0:02  \_ /usr/sbin/httpd
apache   12413  0.0  0.3 398676 13060 ?        Sl   15:19   0:02  \_ /usr/sbin/httpd
apache   12423  0.0  0.3 398676 13060 ?        Sl   15:19   0:02  \_ /usr/sbin/httpd
apache   12425  0.0  0.3 398676 13060 ?        Sl   15:19   0:02  \_ /usr/sbin/httpd
```

## 子プロセスから親プロセスを特定する方法

子プロセスのIDがわかっていれば proc の中から探す  (/proc/(PID)/stat)
```bash
# cat /proc/12425/stat | awk '{print $4}'
12401
```

子プロセス名が分かる場合はps のBSD long formatから PPIDの欄を出して確認する(同じく４列目)
```bash
# ps alxf | grep -e [P]ID -e [h]ttpd
F   UID   PID  PPID PRI  NI    VSZ   RSS WCHAN  STAT TTY        TIME COMMAND
1     0 12401     1  20   0 390480 19920 -      Ss   ?          0:00 /usr/sbin/httpd
5    48 12403 12401  20   0 595348 13060 -      Sl   ?          0:02  \_ /usr/sbin/httpd
5    48 12404 12401  20   0 398676 13060 -      Sl   ?          0:02  \_ /usr/sbin/httpd
5    48 12413 12401  20   0 398676 13060 -      Sl   ?          0:02  \_ /usr/sbin/httpd
5    48 12423 12401  20   0 398676 13060 -      Sl   ?          0:02  \_ /usr/sbin/httpd
5    48 12425 12401  20   0 398676 13060 -      Sl   ?          0:02  \_ /usr/sbin/httpd
```

## 親プロセスから子プロセスを特定する方法

親プロセスのPIDがわかっていれば
```bash
# pgrep -lP 12401
12403 httpd
12404 httpd
12413 httpd
12423 httpd
12425 httpd
```

子プロセスのpidのみ表示
```bash
# pgrep -P 12401
12403
12404
12413
12423
12425
```

ps に f(もしくは-H)オプション([f]orest と [H]ierarchyの略と思われる)とl(BSD long format)をつけて同じPPIDをもつPIDを探す
```bash
# ps axlf
F   UID   PID  PPID PRI  NI    VSZ   RSS WCHAN  STAT TTY        TIME COMMAND
----snip---
5     0  2492     1  20   0  79916  3016 -      Ss   ?          0:00 /usr/sbin/sshd
4     0 12744  2492  20   0 119884  6696 -      Ss   ?          0:00  \_ sshd: ec2-user [priv]
5   500 12746 12744  20   0 119988  4264 -      S    ?          0:00      \_ sshd: ec2-user@pts/0
0   500 12747 12746  20   0 117568  5572 wait   Ss   pts/0      0:00          \_ -bash
0   500 13930 12747  20   0 115184  2496 -      R+   pts/0      0:00              \_ ps axlf
5    38  2502     1  20   0  29288  4308 -      Ss   ?          0:00 ntpd -u ntp:ntp -p /var/run/ntpd.pid -g
5     0  2522     1  20   0  88960  4448 -      Ss   ?          0:04 sendmail: accepting connections
1    51  2531     1  20   0  80420  4072 -      Ss   ?          0:00 sendmail: Queue runner@01:00:00 for /var/spool/clientmqueue
1     0  2579     1  20   0 119516  2592 -      Ss   ?          0:00 crond
5     0  2598     1  20   0  17068   152 -      Ss   ?          0:00 /usr/sbin/atd
4     0  2629     1  20   0 483284 37168 -      Sl   ?          1:07 /usr/bin/dockerd --default-ulimit nofile=1024:4096
4     0  2636  2629  20   0 138788  9804 -      Ssl  ?          0:08  \_ docker-containerd -l unix:///var/run/docker/libcontainerd/docker-containerd.sock --shi
4     0  2707     1  20   0   6460  1704 -      Ss+  ttyS0      0:00 /sbin/agetty ttyS0 9600 vt100-nav
4     0  2709     1  20   0   4312  1512 -      Ss+  tty1       0:00 /sbin/mingetty /dev/tty1
4     0  2717     1  20   0   4312  1420 -      Ss+  tty2       0:00 /sbin/mingetty /dev/tty2
4     0  2719     1  20   0   4312  1400 -      Ss+  tty3       0:00 /sbin/mingetty /dev/tty3
4     0  2722     1  20   0   4312  1496 -      Ss+  tty4       0:00 /sbin/mingetty /dev/tty4
4     0  2725     1  20   0   4312  1440 -      Ss+  tty5       0:00 /sbin/mingetty /dev/tty5
4     0  2728     1  20   0   4312  1392 -      Ss+  tty6       0:00 /sbin/mingetty /dev/tty6
1     0 12401     1  20   0 390480 19920 -      Ss   ?          0:00 /usr/sbin/httpd
5    48 12403 12401  20   0 595348 13060 -      Sl   ?          0:02  \_ /usr/sbin/httpd
5    48 12404 12401  20   0 398676 13060 -      Sl   ?          0:02  \_ /usr/sbin/httpd
5    48 12413 12401  20   0 398676 13060 -      Sl   ?          0:02  \_ /usr/sbin/httpd
5    48 12423 12401  20   0 398676 13060 -      Sl   ?          0:02  \_ /usr/sbin/httpd
5    48 12425 12401  20   0 398676 13060 -      Sl   ?          0:02  \_ /usr/sbin/httpd
```
## 親子関係を見る

```bash
# pstree
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
     ├─6*[mingetty]
     ├─ntpd
     ├─rngd
     ├─rpc.statd
     ├─rpcbind
     ├─rsyslogd───3*[{rsyslogd}]
     ├─2*[sendmail]
     ├─sshd─┬─sshd───sshd───bash───sudo───su───bash───pstree
     │      └─2*[sshd───sshd───bash]
     └─udevd───2*[udevd]
```

pidを表示する

```bash
# pstree -p
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
        ├─httpd(14801)─┬─httpd(14803)─┬─{httpd}(14805)
        │              │              ├─{httpd}(14806)
        │              │              ├─{httpd}(14807)
        │              │              ├─{httpd}(14808)
        │              │              ├─{httpd}(14809)
        │              │              ├─{httpd}(14810)
        │              │              ├─{httpd}(14811)
        │              │              ├─{httpd}(14812)
        │              │              ├─{httpd}(14813)
        │              │              ├─{httpd}(14814)
        │              │              ├─{httpd}(14815)
        │              │              ├─{httpd}(14816)
        │              │              ├─{httpd}(14817)
        │              │              ├─{httpd}(14818)
        │              │              ├─{httpd}(14819)
        │              │              ├─{httpd}(14820)
        │              │              └─{httpd}(14822)
        │              ├─httpd(14804)───{httpd}(14827)
        │              ├─httpd(14821)───{httpd}(14824)
        │              ├─httpd(14823)───{httpd}(14826)
        │              └─httpd(14825)───{httpd}(14828)
        ├─irqbalance(2283)
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
        ├─sendmail(2522)
        ├─sendmail(2531)
        ├─sshd(2492)─┬─sshd(12744)───sshd(12746)───bash(12747)───sudo(14621)───su(14622)───bash(14623)───pstree(14874)
        │            ├─sshd(14040)───sshd(14042)───bash(14043)
        │            └─sshd(14073)───sshd(14075)───bash(14076)
        └─udevd(1554)─┬─udevd(2679)
                      └─udevd(2685)
````

親子のみを抜き出す  
httpdの親プロセスを引数につける( {} で囲まれているのはThread)



```bash
# pstree -p 14801
httpd(14801)─┬─httpd(14803)─┬─{httpd}(14805)
             │              ├─{httpd}(14806)
             │              ├─{httpd}(14807)
             │              ├─{httpd}(14808)
             │              ├─{httpd}(14809)
             │              ├─{httpd}(14810)
             │              ├─{httpd}(14811)
             │              ├─{httpd}(14812)
             │              ├─{httpd}(14813)
             │              ├─{httpd}(14814)
             │              ├─{httpd}(14815)
             │              ├─{httpd}(14816)
             │              ├─{httpd}(14817)
             │              ├─{httpd}(14818)
             │              ├─{httpd}(14819)
             │              ├─{httpd}(14820)
             │              └─{httpd}(14822)
             ├─httpd(14804)───{httpd}(14827)
             ├─httpd(14821)───{httpd}(14824)
             ├─httpd(14823)───{httpd}(14826)
             └─httpd(14825)───{httpd}(14828)
```



## プロセス名からプロセス一覧の取得

```bash
# pidof httpd
12425 12423 12413 12404 12403 12401
```
```bash
# pgrep httpd
12401
12403
12404
12413
12423
12425
```
似てるがpgrepの方はもう少しゆるく検索できる

例えば`httpd.sh`というシェルスクリプトをバックグラウンドで動かした場合

```bash
$ ./httpd.sh &
[1] 13933
```

プロセスが一つ増えている
```bash
$ pgrep -f "httpd"
12401
12403
12404
12413
12423
12425
13933
```
詳細に表示すると `/bin/bash ./httpd.sh`が混ざっている事が確認できる
```bash
$ pgrep -lf "httpd"
12401 /usr/sbin/httpd
12403 /usr/sbin/httpd
12404 /usr/sbin/httpd
12413 /usr/sbin/httpd
12423 /usr/sbin/httpd
12425 /usr/sbin/httpd
13933 /bin/bash ./httpd.sh
```

プロセス名で特定しているpidofでは引っかからない(ただし同じ名前だと引っかかる)

### 同名のプログラムの場合の検証

httpdのプロセスを確認
```bash
$ pidof httpd
12425 12423 12413 12404 12403 12401
```

golangでsleepが入ったプログラムをhttpdという名前で作る
```go
// You can edit this code!
// Click here and start typing.
package main

import "fmt"
import "time"

func main() {
        time.Sleep(10000 * time.Millisecond)
        fmt.Println("Hello, 世界")

}
```

別ttyでbuildし同名の実行ファイルを実行
```bash
$ go build httpd.go
$ /home/ec2-user/httpd
```

プロセスを確認
```bash
$ pidof httpd
14605 12425 12423 12413 12404 12403 12401

$  ps axuf | grep -e "[%]CPU" -e "[h]ttpd"
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
ec2-user 14605  0.0  0.0   2980   860 pts/1    Sl+  21:01   0:00  |           \_ /home/ec2-user/httpd
root     12401  0.0  0.4 390480 19920 ?        Ss   15:19   0:00 /usr/sbin/httpd
apache   12403  0.0  0.3 595348 13060 ?        Sl   15:19   0:03  \_ /usr/sbin/httpd
apache   12404  0.0  0.3 398676 13060 ?        Sl   15:19   0:02  \_ /usr/sbin/httpd
apache   12413  0.0  0.3 398676 13060 ?        Sl   15:19   0:02  \_ /usr/sbin/httpd
apache   12423  0.0  0.3 398676 13060 ?        Sl   15:19   0:02  \_ /usr/sbin/httpd
apache   12425  0.0  0.3 398676 13060 ?        Sl   15:19   0:02  \_ /usr/sbin/httpd
```




## pgrepで出したプロセスをkill

pgrepで出したプロセスをkillしたい場合は`pkill`を使用する


psでhttpdのプロセスを確認
```bash
# ps axuf | grep -e [%]CPU -e [h]ttpd
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root     14667  0.0  0.4 390480 20104 ?        Ss   21:06   0:00 /usr/sbin/httpd
apache   14669  0.0  0.3 595348 13064 ?        Sl   21:06   0:00  \_ /usr/sbin/httpd
apache   14670  0.0  0.3 398676 13064 ?        Sl   21:06   0:00  \_ /usr/sbin/httpd
apache   14686  0.0  0.3 398676 13064 ?        Sl   21:06   0:00  \_ /usr/sbin/httpd
apache   14689  0.0  0.3 398676 13064 ?        Sl   21:06   0:00  \_ /usr/sbin/httpd
apache   14691  0.0  0.3 398676 13064 ?        Sl   21:06   0:00  \_ /usr/sbin/httpd
```

pgrepでhttpdのプロセスIDを再度確認
```bash
# pgrep httpd
14667
14669
14670
14686
14689
14691
```

pkillする
```bash
# pkill httpd
```

プロセスがあるか確認
```bash
# ps axuf | grep -e [%]CPU -e [h]ttpd
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
```
