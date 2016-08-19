
`~/.ssh/config`

```
Host bastion
	HostName 192.168.0.10

Host targetserver
	HostName 192.168.0.20
	Port 22
	ProxyCommand ssh -W %h:%p bastion
```

or

```
Host bastion
	HostName 192.168.0.10

Host targetserver
	HostName 192.168.0.20
	Port 22
	ProxyCommand ssh bastion nc %h %p
```
