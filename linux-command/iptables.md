
```console
$ sudo iptables -nvL (-t fillter) --line-number
```

```console
$ sudo iptables -nvL -t nat
```

```console
$ sudo iptables -A [CHAIN] -i [interface] -d [dest] -s [src] -p [protocal] --dport [port] -j ACCEPT 
```

```console
$ sudo iptables -D [CHAIN] [number]
```
