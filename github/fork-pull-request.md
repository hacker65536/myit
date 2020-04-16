# for and pull request


install hub
--



clone repository (from others)
--

```console
$ hub clone https://github.com/oracle2k/hubforkprtest
Cloning into 'hubforkprtest'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 594 bytes | 297.00 KiB/s, done.
```


check repository
--

```console
$ git branch -vv
* master 7d692a1 [origin/master] Initial commit
```

```console
$ git remote -vv
origin	https://github.com/oracle2k/hubforkprtest (fetch)
origin	https://github.com/oracle2k/hubforkprtest (push)
```

fork and change remote name
--

```console
$ hub fork --remote-name=origin
renaming existing "origin" remote to "upstream"
Updating origin
From https://github.com/oracle2k/hubforkprtest
 * [new branch]      master     -> origin/master
new remote: origin
```


```console
$ git branch -vv
* master 7d692a1 [upstream/master] Initial commit
```

```console
$ git remote -vv
origin	git@github.com:hacker65536/hubforkprtest.git (fetch)
origin	git@github.com:hacker65536/hubforkprtest.git (push)
upstream	https://github.com/oracle2k/hubforkprtest (fetch)
upstream	https://github.com/oracle2k/hubforkprtest (push)
```


change remote-tracking branch
 --
 
 ```console
$ git branch -u origin/master master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```

```console
$ git branch -vv
* master 7d692a1 [origin/master] Initial commit
```

```console
$ git branch -vva
* master                  7d692a1 [origin/master] Initial commit
  remotes/origin/master   7d692a1 Initial commit
  remotes/upstream/HEAD   -> upstream/master
  remotes/upstream/master 7d692a1 Initial commit
```

create branch for pull request
--

- configure 
  - user.name 
  - user.email 
  - credentials(token)
  - push.default
  
```console
$ git config --local user.name hacker65536 
$ git config --local user.email s.hacker65536@gmail.com 
$ git config --local credential.helper "store --file ~/.myaccount-credentials"
$ git config --global push.default current
```


```console
$ git checkout -b fixpullrequestbranch
```

```console
$ git add somechanges
$ git commit -m "fix something"
$ git push 
```

configure `~/.config/hub` 

```console
$ hub pull-request 
```
