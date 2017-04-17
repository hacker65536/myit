
```
[ec2-user@ip-172-31-4-24 ~]$ ps axu | grep [n]ginx
root      5377  0.0  0.1  59132  1088 ?        Ss   Apr10   0:00 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
nginx     5379  0.0  0.6  59768  6184 ?        S    Apr10   0:00 nginx: worker process
[ec2-user@ip-172-31-4-24 ~]$ pidstat -u -p 5377,5379
Linux 4.9.17-8.31.amzn1.x86_64 (ip-172-31-4-24) 	04/17/2017 	_x86_64_	(1 CPU)

03:27:28 PM       PID    %usr %system  %guest    %CPU   CPU  Command
03:27:28 PM      5377    0.00    0.00    0.00    0.00     0  nginx
03:27:28 PM      5379    0.00    0.00    0.00    0.00     0  nginx
```
