
githubにcommitミスしたときにひとつ前のcommitに戻す場合

```bash
git reset --hard HEAD^
#git reset --soft HEAD^ #leave the file
git push -f origin HEAD^:master
```

直前のcommitをやり直す

```bash
git add .
git commit --amend
```

localでmergeしたりとcommitをすすめてしまった場合
```bash
$ git status
On branch master
Your branch is ahead of 'origin/master' by 2 commits.
  (use "git push" to publish your local commits)
```
```
git reset --hard origin/master
```
