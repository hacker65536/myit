# Extending Amazon Linux 2 with EPEL and Let’s Encrypt

https://aws.amazon.com/jp/blogs/compute/extending-amazon-linux-2-with-epel-and-lets-encrypt/



```console
$ sudo amazon-linux-extras install -y epel
```

```console
$ sudo yum install -y python2-certbot-apache
```

```console
$ sudo systemctl start httpd
```

```console
$ pgrep -a httpd
3762 /usr/sbin/httpd -DFOREGROUND
3764 /usr/sbin/httpd -DFOREGROUND
3765 /usr/sbin/httpd -DFOREGROUND
3766 /usr/sbin/httpd -DFOREGROUND
3767 /usr/sbin/httpd -DFOREGROUND
3768 /usr/sbin/httpd -DFOREGROUND
```

```console
$ sudo touch /var/www/html/index.html
```

```console
$ curl -I localhost
HTTP/1.1 200 OK
Date: Thu, 14 May 2020 16:53:51 GMT
Server: Apache/2.4.41 () OpenSSL/1.0.2k-fips
Upgrade: h2,h2c
Connection: Upgrade
Last-Modified: Thu, 14 May 2020 16:53:47 GMT
ETag: "0-5a59e8a4c75cb"
Accept-Ranges: bytes
Content-Type: text/html; charset=UTF-8
```



```console
$ sudo certbot -i apache -a manual --preferred-challenges dns -d lamp.example.com
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator manual, Installer apache
Obtaining a new certificate
Performing the following challenges:
dns-01 challenge for lamp.example.com

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NOTE: The IP of this machine will be publicly logged as having requested this
certificate. If you're running certbot in manual mode on a machine that is not
your server, please ensure you're okay with that.

Are you OK with your IP being logged?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: Y

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please deploy a DNS TXT record under the name
_acme-challenge.lamp.example.com with the following value:

FGyiZ4YCJjny_8MjPhP4QgBjAH3JEejJgWaWtIXncT4

Before continuing, verify the record is deployed.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue
```
