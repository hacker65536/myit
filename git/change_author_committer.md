
```bash
 git filter-branch -f  --commit-filter '
GIT_AUTHOR_NAME='hacker65536'
GIT_AUTHOR_EMAIL='email'
GIT_COMMITER_NAME='hacker65536'
GIT_COMMITER_EMAIL='email'
git commit-tree "$@"
' HEAD

git push -f origin master
```
