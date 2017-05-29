~/.ssh/config

```sshconfig
host github1.com
 hostname github.com
 user git
 identityfile ~/.ssh/github1

host github2.com
 hostname github.com
 user git
 identityfile ~/.ssh/github2
 ```
 
 ```bash
cd /PATH/REPO1
git remote set-url origin git@github1.com/myname/myrepo.git

cd /PATH/REPO2
git remote set-url origin git@github2.com/othername/otherrepo.git
```
