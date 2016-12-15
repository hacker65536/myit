# host

DNS lookup utility

```bash
rpm -qf /usr/bin/host
bind-utils-9.8.2-0.47.rc1.51.amzn1.x86_64
```
* -a = "-v -t any"
* -v = "-d"
* -d verbose

## example

```bash
# host -t type {name} [server]
host -t a www.yahoo.co.jp 8.8.8.8
Using domain server:
Name: 8.8.8.8
Address: 8.8.8.8#53
Aliases:

www.yahoo.co.jp is an alias for www.g.yahoo.co.jp.
www.g.yahoo.co.jp has address 183.79.43.200
www.g.yahoo.co.jp has address 183.79.139.228
www.g.yahoo.co.jp has address 118.151.235.191
www.g.yahoo.co.jp has address 118.151.231.231
```
