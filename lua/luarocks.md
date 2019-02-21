# luarocks

require lua-devel(lua.h)

install luarocks
--
```console
$ sudo yum install luarocks
```

install modules via luarocks
--
```console
$ luarocks search luasocket

Search results:
===============


Rockspecs and source rocks:
---------------------------

luasocket
   3.0rc1-2 (rockspec) - https://luarocks.org
   3.0rc1-2 (src) - https://luarocks.org
   3.0rc1-1 (rockspec) - https://luarocks.org
   3.0rc1-1 (src) - https://luarocks.org
   2.0.2-6 (rockspec) - https://luarocks.org
   2.0.2-5 (rockspec) - https://luarocks.org
   2.0.2-5 (src) - https://luarocks.org
   2.0.2-4 (rockspec) - https://luarocks.org
   2.0.2-4 (src) - https://luarocks.org
   2.0.2-3 (rockspec) - https://luarocks.org
   2.0.2-3 (src) - https://luarocks.org
   2.0.2-2 (rockspec) - https://luarocks.org
   2.0.2-2 (src) - https://luarocks.org
   2.0.2-1 (rockspec) - https://luarocks.org
   2.0.2-1 (src) - https://luarocks.org
   2.0.1-3 (rockspec) - https://luarocks.org
   2.0.1-3 (src) - https://luarocks.org
   2.0.1-2 (rockspec) - https://luarocks.org
   2.0.1-2 (src) - https://luarocks.org

luasocket-lanes
   3.0-3 (rockspec) - https://luarocks.org
   3.0-3 (src) - https://luarocks.org
   3.0-1 (rockspec) - https://luarocks.org
   3.0-1 (src) - https://luarocks.org

luasocket-unix
   2.0.2-2 (rockspec) - https://luarocks.org
   2.0.2-2 (src) - https://luarocks.org
   2.0.2-1 (rockspec) - https://luarocks.org
   2.0.2-1 (src) - https://luarocks.org

```

```console
$ luarocks --local install luasocket
Installing https://luarocks.org/luasocket-3.0rc1-2.src.rock...
Using https://luarocks.org/luasocket-3.0rc1-2.src.rock... switching to 'build' mode
Archive:  v3.0-rc1.zip
22cd5833fcc0e272f26004a79c8545e959ba406b
   creating: luasocket-3.0-rc1/
  inflating: luasocket-3.0-rc1/.gitignore
  inflating: luasocket-3.0-rc1/.travis.yml
---snip---
options.o src/inet.o src/except.o src/select.o src/tcp.o src/udp.o src/usocket.o
Updating manifest for /home/ec2-user/.luarocks/lib64/luarocks/rocks
No existing manifest. Attempting to rebuild...
luasocket 3.0rc1-2 is now built and installed in /home/ec2-user/.luarocks (license: MIT)
```

set path
--
```console
$ echo 'eval $(luarocks path --bin)' >> ~/.bashrc
$ source ~/.bashrc
```

