
`StrictHostKeyChecking no`


sshconfig
```sshconfig
host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
```


command
```
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null servername.com
```
