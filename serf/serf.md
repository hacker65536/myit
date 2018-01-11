

amzlinux2

require golang
```
sudo amazon-linux-extras install golang1.9
```

install
```
go get -u github.com/hashicorp/serf/cmd/serf
```

path
```
export PATH=$HOME/go/bin:$PATH
```

start agent
```
serf agent &
```


join node (other node x n)
```
serf agent join 172.31.16.172 &
```

list members
```
serf members
```

```
    2018/01/11 11:22:31 [INFO] agent.ipc: Accepted client: 127.0.0.1:59120
ip-172-31-28-172.us-east-2.compute.internal  172.31.28.172:7946  alive
ip-172-31-26-62.us-east-2.compute.internal   172.31.26.62:7946   alive
ip-172-31-16-76.us-east-2.compute.internal   172.31.16.76:7946   alive
ip-172-31-30-156.us-east-2.compute.internal  172.31.30.156:7946  alive
```


stop node
```
$ pkill serf
==> Caught signal: terminated
    2018/01/11 11:23:32 [INFO] agent: requesting serf shutdown
    2018/01/11 11:23:32 [WARN] serf: Shutdown without a Leave
    2018/01/11 11:23:32 [INFO] agent: shutdown complete
[1]+  Exit 1                  ./go/bin/serf agent -join=172.31.28.172
```

other node
```
2018/01/11 11:23:35 [INFO] memberlist: Suspect ip-172-31-26-62.us-east-2.compute.internal has failed, no acks received
2018/01/11 11:23:38 [INFO] memberlist: Marking ip-172-31-26-62.us-east-2.compute.internal as failed, suspect timeout reached (2 peer confirmations)
2018/01/11 11:23:38 [INFO] serf: EventMemberFailed: ip-172-31-26-62.us-east-2.compute.internal 172.31.26.62
2018/01/11 11:23:38 [INFO] memberlist: Suspect ip-172-31-26-62.us-east-2.compute.internal has failed, no acks received
2018/01/11 11:23:39 [INFO] agent: Received event: member-failed
2018/01/11 11:24:01 [INFO] serf: attempting reconnect to ip-172-31-26-62.us-east-2.compute.internal 172.31.26.62:7946
2018/01/11 11:24:31 [INFO] serf: attempting reconnect to ip-172-31-26-62.us-east-2.compute.internal 172.31.26.62:7946
2018/01/11 11:25:06 [INFO] agent.ipc: Accepted client: 127.0.0.1:59142
```

```
$ serf members
ip-172-31-16-76.us-east-2.compute.internal   172.31.16.76:7946   alive
ip-172-31-30-156.us-east-2.compute.internal  172.31.30.156:7946  alive
ip-172-31-28-172.us-east-2.compute.internal  172.31.28.172:7946  alive
ip-172-31-26-62.us-east-2.compute.internal   172.31.26.62:7946   failed
```

send event
```
$ serf event test
2018/01/11 11:25:45 [INFO] agent.ipc: Accepted client: 127.0.0.1:59148
Event 'test' dispatched! Coalescing enabled: true
```

other node
```
2018/01/11 11:25:46 [INFO] agent: Received event: user-event: test
```
