
```bash
echo "192.168.1.2 mysqlhost" >> ~/.hosts
export HOSTFILE=~/.hosts

m # M-@ complete-hostname
mysqlhost
```
```bash
echo "fakehost realhost" > /etc/host.aliases
echo "export HOSTALIASES=/etc/host.aliases" >> /etc/profile
. /etc/profile

ping fakehost
```

ping suids to root
