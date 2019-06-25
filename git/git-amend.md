
show committer and author
```console
$ git log -1 --pretty=full 
commit e05a3c6b5daee3d44e2fb829285477def7d7a704 (HEAD -> master, origin/master)
Author: hacker65536 <s.hacker65536@gmail.com>
Commit: hacker65536 <s.hacker65536@gmail.com>

    Update
```

show commiter's info
```console
$ git config --get user.email 
s.hacker65536@gmail.com
$ git config --get user.name
hacker65536
```

```console
$ git commit --amend --author="hacker65536 <s.hacker65536@gmail.com>"
```


```console
$ git push --force
```
