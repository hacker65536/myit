# openresty
https://openresty.org/


install
--

https://openresty.org/en/download.html


### from source

require
- gcc
- pcre-devel
- openssl-devel

```console
$ wget https://openresty.org/download/openresty-1.13.6.2.tar.gz
$ tar zxvf !$:t
$ cd !$:r:r
$ ./configure
```

```console
$ gmake
--snip--
-L/home/ec2-user/openresty-1.13.6.2/build/luajit-root/usr/local/openresty/luajit/lib -L/home/ec2-user/openresty-1.13.6.2/build/luajit-root/usr/local/openresty/luajit/lib -Wl,-rpath,/usr/local/openresty/luajit/lib -Wl,-E -Wl,-E -ldl -lpthread -lcrypt -L/home/ec2-user/openresty-1.13.6.2/build/luajit-root/usr/local/openresty/luajit/lib -lluajit-5.1 -lm -ldl -L/home/ec2-user/openresty-1.13.6.2/build/luajit-root/usr/local/openresty/luajit/lib -lluajit-5.1 -lm -ldl -lpcre -lssl -lcrypto -ldl -lz \
-Wl,-E
sed -e "s|%%PREFIX%%|/usr/local/openresty/nginx|" \
        -e "s|%%PID_PATH%%|/usr/local/openresty/nginx/logs/nginx.pid|" \
        -e "s|%%CONF_PATH%%|/usr/local/openresty/nginx/conf/nginx.conf|" \
        -e "s|%%ERROR_LOG_PATH%%|/usr/local/openresty/nginx/logs/error.log|" \
        < docs/man/nginx.8 > objs/nginx.8
gmake[2]: Leaving directory `/home/ec2-user/openresty-1.13.6.2/build/nginx-1.13.6'
gmake[1]: Leaving directory `/home/ec2-user/openresty-1.13.6.2/build/nginx-1.13.6'
```
```console
$ sudo gmake install
--snip--
gmake[2]: Leaving directory `/home/ec2-user/openresty-1.13.6.2/build/nginx-1.13.6'
gmake[1]: Leaving directory `/home/ec2-user/openresty-1.13.6.2/build/nginx-1.13.6'
mkdir -p /usr/local/openresty/site/lualib /usr/local/openresty/site/pod /usr/local/openresty/site/manifest
ln -sf /usr/local/openresty/nginx/sbin/nginx /usr/local/openresty/bin/openresty
```

example
--
```console
$ /usr/local/openresty/bin/resty -e 'print("hello, world")'
hello, world
```

```console
$ echo 'export PATH=/usr/local/openresty/bin:$PATH' >> ~/.bashrc
$ . !$
```

```console
$ mkdir -p ~/work/{logs,conf}
```
```console
$ cat <<'EOF' > ~/work/conf/nginx.conf
worker_processes  1;
error_log logs/error.log;
events {
    worker_connections 1024;
}
http {
    server {
        listen 8080;
        location / {
            default_type text/html;
            content_by_lua '
                ngx.say("<p>hello, world</p>")
            ';
        }
    }
}
EOF
```

```console
$ ls -la /usr/local/openresty/nginx/sbin/
total 18504
drwxr-xr-x 2 root root       19 Feb 25 06:35 .
drwxr-xr-x 6 root root       54 Feb 25 06:35 ..
-rwxr-xr-x 1 root root 18946272 Feb 25 06:35 nginx
```
```console
$ PATH=/usr/local/openresty/nginx/sbin:$PATH
$ export PATH
```

```console
$ cd ~/work
$ nginx -p `pwd`/ -c conf/nginx.conf
```
