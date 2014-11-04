#pattern match

```bash
shopt extglob
```
show current setting 

```bash
shopt -s extglob
```
enable use glob

```bash
shopt -u extglob
```
turn off


```bash
echo "shopt -s extglob" >> ~/.bash_rc
source ~/.bash_rc
```

you'll be able to use glob from when you logged in

#example

```bash
ls -d !(*.json)
```
you will get list exclude *.json

```bash
cp !(a.*) /target/dir
```
copy file except a.*
