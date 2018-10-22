## generate key

```
$ email=your_email@youremail.com
$ ssh-keygen -t rsa -N "" -f ~/.ssh/githubkey -C $email
```
## add key to web console of github

github.com-> settings-> SSH keys -> New SSH key


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

## configure directory

first 
```console
$ email=s.hacker65536@gmail.com
$ name=shacker
$ cd workdir
$ git init
$ git config --local user.email $email
$ git config --local user.name $name
$ git add README.md # create master branch
$ git commit -m "init" # create master branch
$ git remote add origin git@github.com:hacker65536/$(basename $(pwd)).git
$ # git remote set-url origin git@github.com:hacker65536/$(basename $(pwd)).git
$ git push -u origin master
```
