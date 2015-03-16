#install
```bash
cd /usr/local/src
wget --no-check-certificate -q  https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh 
sh gitflow-installer.sh 
```
#how to

##enable new project

```bash
git config --global user.email "mail@address"
git config --global user.name "user"

git clone user@host:emptyproject

cd emptyproject
```


git flow init (-d = ommit inquiry)
```bash
git flow init -d
```


push branch `develop` and `master` to origin server  
```bash
git push --all
```


##
