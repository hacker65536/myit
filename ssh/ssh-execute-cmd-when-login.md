

specify command to be executed on the remote machine upon login  
https://unix.stackexchange.com/questions/91747/ssh-config-specify-command-to-be-executed-on-the-remote-machine-upon-login

add to `~/.ssh/config`
```
RequestTTY yes
RemoteCommand zsh
```
