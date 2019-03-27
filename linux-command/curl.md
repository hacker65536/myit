
download file


`-O` --remote-name

```bash
curl -O http://fileuri
```

`-o` --output

```bash
curl http://fileuri -o file1 
```

`-s` --silent
```bash
curl -s http://fileuri
```


`-S` --show-error
```bash
curl -S http://fileuri
```

`-L` --location
```
curl -L http://fileuri-redirect
```


```bash
curl -sSLO http://fileuri
```

`-I`  --head (fetch the headers only)
```bash
# curl -I www.yahoo.co.jp
HTTP/1.1 301 Redirect
Date: Wed, 07 Mar 2018 06:29:58 GMT
Connection: keep-alive
Via: http/1.1 edge1432.img.bbt.yahoo.co.jp (ApacheTrafficServer [c s f ])
Server: ATS
Cache-Control: no-store
Location: https://www.yahoo.co.jp:443/
Content-Type: text/html
Content-Language: en
Content-Length: 6794
```


cookie
```
curl -c cookie.txt -d "id=mymail@gmail.com" -d "password=mypassword" https://login.somesite.org/
curl -b cookie.txt -O http://download.somesite.com/file.zip
```


insecure
```console
$ curl  https://xxx.xxx.xxx
curl: (60) Issuer certificate is invalid.
More details here: http://curl.haxx.se/docs/sslcerts.html

curl performs SSL certificate verification by default, using a "bundle"
 of Certificate Authority (CA) public keys (CA certs). If the default
 bundle file isn't adequate, you can specify an alternate file
 using the --cacert option.
If this HTTPS server uses a certificate signed by a CA represented in
 the bundle, the certificate verification probably failed due to a
 problem with the certificate (it might be expired, or the name might
 not match the domain name in the URL).
If you'd like to turn off curl's verification of the certificate, use
 the -k (or --insecure) option.
 
$ curl -k https://xxx.xxx.xxx
```
