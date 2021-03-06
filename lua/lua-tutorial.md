# lua
https://www.lua.org/about.html

## options
```console
$ lua --help
usage: lua [options] [script [args]].
Available options are:
  -e stat  execute string 'stat'
  -l name  require library 'name'
  -i       enter interactive mode after executing 'script'
  -v       show version information
  --       stop handling options
  -        execute stdin and stop handling options
```

```console
$ lua -e "print(math.sin(12))"
-0.53657291800043
```


## interactive
http://lua-users.org/wiki/InteractiveLua

```console
$ lua
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> = 10+20
30
> t={1,2,3,4,5}
> =t
table: 0x16a8db0
> for i,v in ipairs(t) do
>> print(i ,':',v)
>> end
1       :       1
2       :       2
3       :       3
4       :       4
5       :       5
> t2={a=1,b=2,c=3}
> for k,v in pairs(t2) do
>> print(k..":"..v)
>> end
a:1
c:3
b:2
```

