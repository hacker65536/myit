## generate key

```
$ ssh-keygen -t rsa -N "" -f ~/.ssh/githubkey -C "your_email@youremail.com"
```
## add key to web console of github
settings-> SSH keys -> New SSH key


## configure ssh
~/.ssh/config
```
Host github.com
        Hostname github.com
        User git
        Identityfile ~/.ssh/githubkey
```

```bash
$ git clone git@github.com:myname/myrepo.git
```
