```console
$ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)
nothing to commit, working tree clean
```

```console
$ git pull --rebase
First, rewinding head to replay your work on top of it...
```
```console
$ git status 
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working tree clean
```