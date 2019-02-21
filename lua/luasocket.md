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
local socket = require( "socket" )
local client = assert(socket.connect("127.0.0.1", 80))
client:send( "GET / HTTP/1.0\n\n" )
local line = client:receive()
print( "contents:"..line )
client:close()
```

```console
$ lua socket.lua
contents:HTTP/1.1 200 OK
```

