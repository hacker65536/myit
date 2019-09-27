
```
packet_write_wait: Connection to xxxxxxxx port 22: Broken pipe
```

https://thomas-cokelaer.info/blog/2017/05/packet_write_wait-connection-to-xxx-broken-pipe/


solution
```
Host *
  ServerAliveInterval 30
  ServerAliveCountMax 5
```
