# luasocket

http://w3.impa.br/~diego/software/luasocket/

install via luarocks
--

```console
$ luarocks --local install luasocket
```

server
--
```console
$ docker run -it -d --rm -p 80:80 nginx:latest
```

request
--
```lua
http = require("socket.http")
b,c,h,l = http.request("http://localhost")

--body
print("----body")
print(b)
print()
--status code
print("----status code")
print(c)
print()
--header
print("----header")
for i,v in pairs(h) do print (i .. ":" .. v) end
print()
--
print("----line")
print(l)
print()
```

```console
$ lua socket.lua
contents:HTTP/1.1 200 OK
```

```lua
$ lua socket.lua
----body
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>


----status code
200

----header
connection:close
content-type:text/html
etag:"5c21fedf-264"
accept-ranges:bytes
content-length:612
last-modified:Tue, 25 Dec 2018 09:56:47 GMT
date:Thu, 21 Feb 2019 11:18:02 GMT
server:nginx/1.15.8

----line
HTTP/1.1 200 OK

```
