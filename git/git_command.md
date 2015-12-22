#git command




##settings
###user

default will use `--local` when omit `--local` or `--global`

####local 
only current repository
```bash
git config --local user.name  MyName
git config --local user.email My@address
```
repo/.git/config

####global
all repository of current user will be adapted this settings 
```bash
git config --global user.name  MyName
git config --global user.email My@address
```
~/.gitconfig 

`repo/.git/config` or `~/.gitconfig`
```
[user]
        name = mytest
        email = my@address
```

###push.default
git config --global push.default matching
