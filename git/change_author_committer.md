
```bash
git filter-branch -f  --commit-filter '
GIT_AUTHOR_NAME='shacker'
GIT_AUTHOR_EMAIL='hacker65536@users.noreply.github.com'
GIT_COMMITER_NAME='GitHub'
GIT_COMMITER_EMAIL='noreply@github.com'
git commit-tree "$@"
' HEAD

git push -f origin master
```

```
 git filter-branch -f --env-filter "
 GIT_AUTHOR_NAME='shacker'; 
 GIT_AUTHOR_EMAIL='s.hacker65536@gmail.com'; 
 GIT_COMMITTER_NAME='shacker'; 
 GIT_COMMITTER_EMAIL='s.hacker65536@gmail.com';" HEAD 
 ```
