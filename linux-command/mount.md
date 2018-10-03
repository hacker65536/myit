symlincぽいmount

```
# /usr/local/src の下になにもない
[root@ip-10-0-2-251 ~]# ls -la /usr/local/src/
total 0
drwxr-xr-x  2 root root   6 Oct  3 11:19 .
drwxr-xr-x 12 root root 131 Aug 11 02:01 ..

# /mnt の下になにもない
[root@ip-10-0-2-251 ~]# ls -la /mnt/
total 0
drwxr-xr-x  2 root root   6 Oct  3 11:18 .
dr-xr-xr-x 18 root root 257 Oct  3 09:49 ..

# /mnt と /usr/local/src の下にともにwwwをdirを作る
[root@ip-10-0-2-251 ~]# mkdir /mnt/www
[root@ip-10-0-2-251 ~]# mkdir /usr/local/src/www

# mount bindでディレクトリをつなげる
[root@ip-10-0-2-251 ~]# mount --bind /mnt/www /usr/local/src/www

# ファイルを/mnt/www/のしたに作る
[root@ip-10-0-2-251 ~]# touch /mnt/www/test

# /usr/local/src/wwwの下にも現れる
[root@ip-10-0-2-251 ~]# ls -la /usr/local/src/www/
total 0
drwxr-xr-x 2 root root 18 Oct  3 11:20 .
drwxr-xr-x 3 root root 17 Oct  3 11:20 ..
-rw-r--r-- 1 root root  0 Oct  3 11:20 test

# pwdで確認する
[root@ip-10-0-2-251 ~]# cd /usr/local/src/www/
[root@ip-10-0-2-251 www]# pwd -P
/usr/local/src/www
```
