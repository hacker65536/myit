# lua table

http://hevohevo.hatenablog.com/entry/2013/11/08/045949


```lua
t = {}
t[1] = 1
t[2] = 2
t[5] = 5

print(#t)
print("---")

t = {}
t[1] = 1
t[2] = 2
t[4] = 4

print(#t)
print("---")

t = {'a','b','c',A='hoge','d'}

print(#t)
print("---")
for key,value in pairs(t) do
    print(key, ' = ', value)
end

```
```console
$ lua table.lua
2
---
4
---
4
---
1        =      a
2        =      b
3        =      c
4        =      d
A        =      hoge
```
