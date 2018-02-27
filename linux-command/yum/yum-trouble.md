
```
# yum update
Loaded plugins: fastestmirror, presto
Setting up Update Process
Loading mirror speeds from cached hostfile
 * base: mirror.team-cymru.org
 * epel: mirror.umd.edu
 * extras: mirror.cogentco.com
 * updates: mirror.team-cymru.org
https://mirror.umd.edu/fedora/epel/6/x86_64/repodata/1b65a212f3bfee678f4e65571822731900bfeed1cc5925566be866395080f11b-primary.sqlite.bz2: [Errno 14] PYCURL ERROR 22 - "The requested URL returned error: 404 Not Found"
Trying other mirror.
To address this issue please refer to the below knowledge base article

https://access.redhat.com/articles/1320623

If above article doesn't help to resolve this issue please open a ticket with Red Hat Support.

https://epel.mirror.constant.com/6/x86_64/repodata/1b65a212f3bfee678f4e65571822731900bfeed1cc5925566be866395080f11b-primary.sqlite.bz2: [Errno 14] PYCURL ERROR 22 - "The requested URL returned error: 404 Not Found"
Trying other mirror.
https://mirror.us-midwest-1.nexcess.net/epel/6/x86_64/repodata/1b65a212f3bfee678f4e65571822731900bfeed1cc5925566be866395080f11b-primary.sqlite.bz2: [Errno 14] PYCURL ERROR 22 - "The requested URL returned error: 404 Not Found"
```


ミラーが参照できない、たしかにURLのリソースはなく404となる
時間が置くと何故か問題ない。。。一時的にしても原因はなんだろう。。
