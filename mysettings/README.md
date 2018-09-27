
```bash
yum install -y git
```

```bash
yum install -y jq
```


```bash

echo "host github.com
hostname github.com
user git
identityfile ~/.ssh/githubkey
StrictHostKeyChecking no" >> ~/.ssh/config

chmod 600 ~/.ssh/config
```

```bash
printf 'escape \032\032' >> ~/.screenrc
cat >> ~/.screenrc <<EOF 

# "^Z" is a control code.  input this code type ctrl+v > ctrl+z 
termcapinfo xterm 'is=\E[r\E[m\E[2J\E[H\E[?7h\E[?1;4;6l'
# escape screen resize for xterm

#termcapinfo kterm-color 'is=\E[r\E[m\E[2J\E[H\E[?7h\E[?1;4;6l'
# escape screen resize for kterm-color

defscrollback 4000 

#scrollback 4000 using current screent' 
EOF
```

```bash
username=hacker65536
useremail=s.hacker65536@gmail.com
git config --local user.name "$username"
git config --local user.email "$useremail"
```
