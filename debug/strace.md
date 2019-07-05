# strace

https://strace.io/


example
--

### get pids of httpd
```
$ ps -C httpd -o comm,pid,ppid
COMMAND           PID  PPID
httpd           14245     1
httpd           14304 14245
httpd           14305 14245
httpd           14306 14245
httpd           14307 14245
httpd           14308 14245
httpd           14441 14245
```

### trace pids 

access index.php

```php
<?php
phpinfo()
```


```console
$ sudo strace -p 14245,14304,14305,14306,14307,14308,14441
strace: Process 14245 attached
strace: Process 14304 attached
strace: Process 14305 attached
strace: Process 14306 attached
strace: Process 14307 attached
strace: Process 14308 attached
strace: Process 14441 attached
[pid 14441] accept4(4,  <unfinished ...>
[pid 14245] select(0, NULL, NULL, NULL, {tv_sec=0, tv_usec=773584} <unfinished ...>
[pid 14308] accept4(4,  <unfinished ...>
[pid 14307] accept4(4,  <unfinished ...>
[pid 14306] accept4(4,  <unfinished ...>
[pid 14305] accept4(4,  <unfinished ...>
[pid 14304] accept4(4,  <unfinished ...>
[pid 14245] <... select resumed> )      = 0 (Timeout)
[pid 14245] wait4(-1, 0x7ffc2fd97f4c, WNOHANG|WSTOPPED, NULL) = 0
[pid 14245] times({tms_utime=7, tms_stime=12, tms_cutime=0, tms_cstime=0}) = 1854944690
[pid 14245] select(0, NULL, NULL, NULL, {tv_sec=1, tv_usec=0}) = 0 (Timeout)
[pid 14245] wait4(-1, 0x7ffc2fd97f4c, WNOHANG|WSTOPPED, NULL) = 0
[pid 14245] times({tms_utime=7, tms_stime=12, tms_cutime=0, tms_cstime=0}) = 1854944790
[pid 14245] select(0, NULL, NULL, NULL, {tv_sec=1, tv_usec=0}) = 0 (Timeout)
[pid 14245] wait4(-1, 0x7ffc2fd97f4c, WNOHANG|WSTOPPED, NULL) = 0
[pid 14245] times({tms_utime=7, tms_stime=12, tms_cutime=0, tms_cstime=0}) = 1854944890
[pid 14245] select(0, NULL, NULL, NULL, {tv_sec=1, tv_usec=0} <unfinished ...>
[pid 14441] <... accept4 resumed> {sa_family=AF_INET6, sin6_port=htons(41535), inet_pton(AF_INET6, "::ffff:202.214.96.1", &sin6_addr), sin6_flowinfo=htonl(0), sin6_scope_id=0}, [128->28], SOCK_CLOEXEC) = 10
[pid 14441] getsockname(10, {sa_family=AF_INET6, sin6_port=htons(80), inet_pton(AF_INET6, "::ffff:172.31.9.227", &sin6_addr), sin6_flowinfo=htonl(0), sin6_scope_id=0}, [128->28]) = 0
[pid 14441] fcntl(10, F_GETFL)          = 0x2 (flags O_RDWR)
[pid 14441] fcntl(10, F_SETFL, O_RDWR|O_NONBLOCK) = 0
[pid 14441] read(10, "GET / HTTP/1.1\r\nHost: 18.188.223"..., 8000) = 450
[pid 14441] stat("/var/www/html/", {st_mode=S_IFDIR|0755, st_size=23, ...}) = 0
[pid 14441] stat("/var/www/html/index.html", 0x7ffc2fd97a70) = -1 ENOENT (No such file or directory)
[pid 14441] lstat("/var", {st_mode=S_IFDIR|0755, st_size=280, ...}) = 0
[pid 14441] lstat("/var/www", {st_mode=S_IFDIR|0755, st_size=33, ...}) = 0
[pid 14441] lstat("/var/www/html", {st_mode=S_IFDIR|0755, st_size=23, ...}) = 0
[pid 14441] lstat("/var/www/html/index.html", 0x7ffc2fd97a70) = -1 ENOENT (No such file or directory)
[pid 14441] stat("/var/www/html/index.php", {st_mode=S_IFREG|0644, st_size=18, ...}) = 0
[pid 14441] socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE) = 11
[pid 14441] bind(11, {sa_family=AF_NETLINK, nl_pid=0, nl_groups=00000000}, 12) = 0
[pid 14441] getsockname(11, {sa_family=AF_NETLINK, nl_pid=14441, nl_groups=00000000}, [12]) = 0
[pid 14441] sendto(11, {{len=20, type=0x16 /* NLMSG_??? */, flags=NLM_F_REQUEST|0x300, seq=1562293145, pid=0}, "\x00\x00\x00\x00"}, 20, 0, {sa_family=AF_NETLINK, nl_pid=0, nl_groups=00000000}, 12) = 20
[pid 14441] recvmsg(11, {msg_name={sa_family=AF_NETLINK, nl_pid=0, nl_groups=00000000}, msg_namelen=12, msg_iov=[{iov_base=[{{len=76, type=0x14 /* NLMSG_??? */, flags=NLM_F_MULTI, seq=1562293145, pid=14441}, "\x02\x08\x80\xfe\x01\x00\x00\x00\x08\x00\x01\x00\x7f\x00\x00\x01\x08\x00\x02\x00\x7f\x00\x00\x01\x07\x00\x03\x00\x6c\x6f\x00\x00"...}, {{len=88, type=0x14 /* NLMSG_??? */, flags=NLM_F_MULTI, seq=1562293145, pid=14441}, "\x02\x14\x00\x00\x02\x00\x00\x00\x08\x00\x01\x00\xac\x1f\x09\xe3\x08\x00\x02\x00\xac\x1f\x09\xe3\x08\x00\x04\x00\xac\x1f\x0f\xff"...}, {{len=96, type=0x14 /* NLMSG_??? */, flags=NLM_F_MULTI, seq=1562293145, pid=14441}, "\x02\x10\x80\x00\x03\x00\x00\x00\x08\x00\x01\x00\xac\x12\x00\x01\x08\x00\x02\x00\xac\x12\x00\x01\x08\x00\x04\x00\xac\x12\xff\xff"...}, {{len=88, type=0x14 /* NLMSG_??? */, flags=NLM_F_MULTI, seq=1562293145, pid=14441}, "\x02\x10\x80\x00\x04\x00\x00\x00\x08\x00\x01\x00\xac\x11\x00\x01\x08\x00\x02\x00\xac\x11\x00\x01\x08\x00\x04\x00\xac\x11\xff\xff"...}], iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 348
[pid 14441] recvmsg(11, {msg_name={sa_family=AF_NETLINK, nl_pid=0, nl_groups=00000000}, msg_namelen=12, msg_iov=[{iov_base=[{{len=72, type=0x14 /* NLMSG_??? */, flags=NLM_F_MULTI, seq=1562293145, pid=14441}, "\x0a\x80\x80\xfe\x01\x00\x00\x00\x14\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x14\x00\x06\x00"...}, {{len=72, type=0x14 /* NLMSG_??? */, flags=NLM_F_MULTI, seq=1562293145, pid=14441}, "\x0a\x40\x80\xfd\x02\x00\x00\x00\x14\x00\x01\x00\xfe\x80\x00\x00\x00\x00\x00\x00\x00\x16\x64\xff\xfe\xdc\x74\xc2\x14\x00\x06\x00"...}, {{len=72, type=0x14 /* NLMSG_??? */, flags=NLM_F_MULTI, seq=1562293145, pid=14441}, "\x0a\x40\x80\xfd\x04\x00\x00\x00\x14\x00\x01\x00\xfe\x80\x00\x00\x00\x00\x00\x00\x00\x42\xd1\xff\xfe\xbd\x6b\xdb\x14\x00\x06\x00"...}], iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 216
[pid 14441] recvmsg(11, {msg_name={sa_family=AF_NETLINK, nl_pid=0, nl_groups=00000000}, msg_namelen=12, msg_iov=[{iov_base={{len=20, type=NLMSG_DONE, flags=NLM_F_MULTI, seq=1562293145, pid=14441}, 0}, iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 20
[pid 14441] close(11)                   = 0
[pid 14441] socket(AF_INET6, SOCK_DGRAM|SOCK_CLOEXEC, IPPROTO_IP) = 11
[pid 14441] connect(11, {sa_family=AF_INET6, sin6_port=htons(0), inet_pton(AF_INET6, "::", &sin6_addr), sin6_flowinfo=htonl(0), sin6_scope_id=0}, 28) = 0
[pid 14441] getsockname(11, {sa_family=AF_INET6, sin6_port=htons(35612), inet_pton(AF_INET6, "::1", &sin6_addr), sin6_flowinfo=htonl(0), sin6_scope_id=0}, [28]) = 0
[pid 14441] connect(11, {sa_family=AF_UNSPEC, sa_data="\0\0\0\0\0\0\0\0\0\0\0\0\0\0"}, 16) = 0
[pid 14441] connect(11, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
[pid 14441] getsockname(11, {sa_family=AF_INET6, sin6_port=htons(33814), inet_pton(AF_INET6, "::ffff:127.0.0.1", &sin6_addr), sin6_flowinfo=htonl(0), sin6_scope_id=0}, [28]) = 0
[pid 14441] close(11)                   = 0
[pid 14441] socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC, 0) = 11
[pid 14441] connect(11, {sa_family=AF_UNIX, sun_path="/run/php-fpm/www.sock"}, 23) = 0
[pid 14441] fcntl(11, F_GETFL)          = 0x2 (flags O_RDWR)
[pid 14441] fcntl(11, F_SETFL, O_RDWR|O_NONBLOCK) = 0
[pid 14441] writev(11, [{iov_base="\1\1\0\1\0\10\0\0", iov_len=8}, {iov_base="\0\1\0\0\0\0\0\0", iov_len=8}], 2) = 16
[pid 14441] writev(11, [{iov_base="\1\4\0\1\4\20\0\0", iov_len=8}, {iov_base="\t\33UNIQUE_IDXR6zmZmq3QVewJR0ItDEq"..., iov_len=1040}], 2) = 1048
[pid 14441] writev(11, [{iov_base="\1\4\0\1\0\0\0\0", iov_len=8}], 1) = 8
[pid 14441] poll([{fd=11, events=POLLIN|POLLOUT}], 1, 60000) = 1 ([{fd=11, revents=POLLIN|POLLOUT}])
[pid 14441] writev(11, [{iov_base="\1\5\0\1\0\0\0\0", iov_len=8}], 1) = 8
[pid 14441] read(11, "\1\6\0\1\0D\4\0", 8) = 8
[pid 14441] read(11, "X-Powered-By: PHP/7.2.19\r\nConten"..., 68) = 68
[pid 14441] read(11, "\0\0\0\0", 4)     = 4
[pid 14441] poll([{fd=11, events=POLLIN}], 1, 60000) = 1 ([{fd=11, revents=POLLIN}])
[pid 14441] read(11, "\1\6\0\1\377\370\0\0", 8) = 8
[pid 14441] read(11, "<!DOCTYPE html PUBLIC \"-//W3C//D"..., 8192) = 8192
[pid 14441] writev(10, [{iov_base="HTTP/1.1 200 OK\r\nDate: Fri, 05 J"..., iov_len=258}, {iov_base="2000\r\n", iov_len=6}, {iov_base="<!DOCTYPE html PUBLIC \"-//W3C//D"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}], 4) = 8458
[pid 14441] read(11, "></tr>\n<tr><td class=\"e\">Zend Ex"..., 8192) = 8192
[pid 14441] writev(10, [{iov_base="2000\r\n", iov_len=6}, {iov_base="></tr>\n<tr><td class=\"e\">Zend Ex"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}], 3) = 8200
[pid 14441] read(11, "bled </td></tr>\n</table>\n<h2><a "..., 8192) = 8192
[pid 14441] writev(10, [{iov_base="2000\r\n", iov_len=6}, {iov_base="bled </td></tr>\n</table>\n<h2><a "..., iov_len=8192}, {iov_base="\r\n", iov_len=2}], 3) = 8200
[pid 14441] read(11, "ss=\"e\">short_open_tag</td><td cl"..., 8192) = 8192
[pid 14441] writev(10, [{iov_base="2000\r\n", iov_len=6}, {iov_base="ss=\"e\">short_open_tag</td><td cl"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}], 3) = 8200
[pid 14441] read(11, "5 haval224,5 haval256,5  </td></"..., 8192) = 8192
[pid 14441] writev(10, [{iov_base="2000\r\n", iov_len=6}, {iov_base="5 haval224,5 haval256,5  </td></"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}], 3) = 8200
[pid 14441] read(11, "\n<tr><td class=\"e\">connect_succe"..., 8192) = 8192
[pid 14441] writev(10, [{iov_base="2000\r\n", iov_len=6}, {iov_base="\n<tr><td class=\"e\">connect_succe"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}], 3) = 3080
[pid 14441] writev(10, [{iov_base="tched_decimal </td><td class=\"v\""..., iov_len=5118}, {iov_base="\r\n", iov_len=2}], 2) = -1 EAGAIN (Resource temporarily unavailable)
[pid 14441] read(11, "k-fips  26 Jan 2017 </td></tr>\n<"..., 8192) = 8192
[pid 14441] writev(10, [{iov_base="tched_decimal </td><td class=\"v\""..., iov_len=5118}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="k-fips  26 Jan 2017 </td></tr>\n<"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}], 5) = -1 EAGAIN (Resource temporarily unavailable)
[pid 14441] read(11, "RecursiveDirectoryIterator, Recu"..., 8184) = 8184
[pid 14441] writev(10, [{iov_base="tched_decimal </td><td class=\"v\""..., iov_len=5118}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="k-fips  26 Jan 2017 </td></tr>\n<"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="1ff8\r\n", iov_len=6}, {iov_base="RecursiveDirectoryIterator, Recu"..., iov_len=8184}, {iov_base="\r\n", iov_len=2}], 8) = -1 EAGAIN (Resource temporarily unavailable)
[pid 14441] poll([{fd=11, events=POLLIN}], 1, 60000) = 1 ([{fd=11, revents=POLLIN}])
[pid 14441] read(11, "\1\6\0\1,0\0\0", 8) = 8
[pid 14441] read(11, "Sascha Schumann, Jani Taskinen <"..., 8192) = 8192
[pid 14441] writev(10, [{iov_base="tched_decimal </td><td class=\"v\""..., iov_len=5118}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="k-fips  26 Jan 2017 </td></tr>\n<"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="1ff8\r\n", iov_len=6}, {iov_base="RecursiveDirectoryIterator, Recu"..., iov_len=8184}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="Sascha Schumann, Jani Taskinen <"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}], 11) = -1 EAGAIN (Resource temporarily unavailable)
[pid 14441] read(11, "us </td></tr>\n<tr><td class=\"e\">"..., 3120) = 3120
[pid 14441] writev(10, [{iov_base="tched_decimal </td><td class=\"v\""..., iov_len=5118}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="k-fips  26 Jan 2017 </td></tr>\n<"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="1ff8\r\n", iov_len=6}, {iov_base="RecursiveDirectoryIterator, Recu"..., iov_len=8184}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="Sascha Schumann, Jani Taskinen <"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="c30\r\n", iov_len=5}, {iov_base="us </td></tr>\n<tr><td class=\"e\">"..., iov_len=3120}, {iov_base="\r\n", iov_len=2}], 14) = -1 EAGAIN (Resource temporarily unavailable)
[pid 14441] poll([{fd=11, events=POLLIN}], 1, 60000) = 1 ([{fd=11, revents=POLLIN}])
[pid 14441] read(11, "\1\3\0\1\0\10\0\0", 8) = 8
[pid 14441] read(11, "\0\0\0\0\0ere", 8) = 8
[pid 14441] close(11)                   = 0
[pid 14441] writev(10, [{iov_base="tched_decimal </td><td class=\"v\""..., iov_len=5118}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="k-fips  26 Jan 2017 </td></tr>\n<"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="1ff8\r\n", iov_len=6}, {iov_base="RecursiveDirectoryIterator, Recu"..., iov_len=8184}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="Sascha Schumann, Jani Taskinen <"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="c30\r\n", iov_len=5}, {iov_base="us </td></tr>\n<tr><td class=\"e\">"..., iov_len=3120}, {iov_base="\r\n", iov_len=2}, {iov_base="0\r\n\r\n", iov_len=5}], 15) = -1 EAGAIN (Resource temporarily unavailable)
[pid 14441] writev(10, [{iov_base="tched_decimal </td><td class=\"v\""..., iov_len=5118}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="k-fips  26 Jan 2017 </td></tr>\n<"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="1ff8\r\n", iov_len=6}, {iov_base="RecursiveDirectoryIterator, Recu"..., iov_len=8184}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="Sascha Schumann, Jani Taskinen <"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="c30\r\n", iov_len=5}, {iov_base="us </td></tr>\n<tr><td class=\"e\">"..., iov_len=3120}, {iov_base="\r\n", iov_len=2}, {iov_base="0\r\n\r\n", iov_len=5}], 15) = -1 EAGAIN (Resource temporarily unavailable)
[pid 14441] read(10, 0x555c54784058, 8000) = -1 EAGAIN (Resource temporarily unavailable)
[pid 14441] writev(10, [{iov_base="tched_decimal </td><td class=\"v\""..., iov_len=5118}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="k-fips  26 Jan 2017 </td></tr>\n<"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="1ff8\r\n", iov_len=6}, {iov_base="RecursiveDirectoryIterator, Recu"..., iov_len=8184}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="Sascha Schumann, Jani Taskinen <"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="c30\r\n", iov_len=5}, {iov_base="us </td></tr>\n<tr><td class=\"e\">"..., iov_len=3120}, {iov_base="\r\n", iov_len=2}, {iov_base="0\r\n\r\n", iov_len=5}], 15) = -1 EAGAIN (Resource temporarily unavailable)
[pid 14441] poll([{fd=10, events=POLLOUT}], 1, 60000) = 1 ([{fd=10, revents=POLLOUT}])
[pid 14441] writev(10, [{iov_base="tched_decimal </td><td class=\"v\""..., iov_len=5118}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="k-fips  26 Jan 2017 </td></tr>\n<"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="1ff8\r\n", iov_len=6}, {iov_base="RecursiveDirectoryIterator, Recu"..., iov_len=8184}, {iov_base="\r\n", iov_len=2}, {iov_base="2000\r\n", iov_len=6}, {iov_base="Sascha Schumann, Jani Taskinen <"..., iov_len=8192}, {iov_base="\r\n", iov_len=2}, {iov_base="c30\r\n", iov_len=5}, {iov_base="us </td></tr>\n<tr><td class=\"e\">"..., iov_len=3120}, {iov_base="\r\n", iov_len=2}, {iov_base="0\r\n\r\n", iov_len=5}], 15) = 32844
[pid 14441] write(7, "202.214.96.1 - - [05/Jul/2019:02"..., 195) = 195
[pid 14441] times({tms_utime=10, tms_stime=26, tms_cutime=0, tms_cstime=0}) = 1854944922
[pid 14441] poll([{fd=10, events=POLLIN}], 1, 5000 <unfinished ...>
[pid 14245] <... select resumed> )      = 0 (Timeout)
[pid 14245] wait4(-1, 0x7ffc2fd97f4c, WNOHANG|WSTOPPED, NULL) = 0
[pid 14245] times({tms_utime=7, tms_stime=12, tms_cutime=0, tms_cstime=0}) = 1854944990
[pid 14245] select(0, NULL, NULL, NULL, {tv_sec=1, tv_usec=0}^Cstrace: Process 14245 detached
 <detached ...>
strace: Process 14304 detached
strace: Process 14305 detached
strace: Process 14306 detached
strace: Process 14307 detached
strace: Process 14308 detached
strace: Process 14441 detached
```
