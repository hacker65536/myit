
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
