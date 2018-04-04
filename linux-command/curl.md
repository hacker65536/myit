
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
