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


##add function
start feature branch  
```bash
git flow feature start function
git add *
git commit -m " add "
```
finished feature branch  
```bash
git flow feature finish function
```
push  
```bash
git branch
```
```
*develop
 master
```

```bash 
git push origin develop
```
