#generate key

```
ssh-keygen -t rsa -N "" -f ~/.ssh/githubkey -C "your_email@youremail.com"
```

settings-> SSH keys -> New SSH key

~/.ssh/config
```
Host github.com
        Hostname github.com
        User git
        Identityfile ~/.ssh/githubkey
```

```bash
git clone git@github.com:myname/myrepo.git
```
