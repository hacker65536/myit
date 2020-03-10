
first push and tracking origin/master
```console
$ git push -u origin master
```


```console
$ git push
fatal: The current branch testbranch has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin testbranch
```



push default current

```console
$ git config --global push.default current
```

```gitconfig
[push]
  default = current
 ```
