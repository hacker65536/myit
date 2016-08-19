
`~/.ssh/config`

```sshconfig
Host bastion
	HostName 192.168.0.10

Host targetserver
	HostName 192.168.0.20
	Port 22
	ProxyCommand ssh -W %h:%p bastion
```

or

```sshconfig
Host bastion
	HostName 192.168.0.10

Host targetserver
	HostName 192.168.0.20
	Port 22
	ProxyCommand ssh bastion nc %h %p
```

or

```
ssh -t -o ProxyCommand='ssh 192.168.0.10 nc 192.168.0.20 22' 192.168.0.20
```
