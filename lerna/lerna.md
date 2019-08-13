# lerna

https://lerna.js.org/

>Lerna is a tool that optimizes the workflow around managing multi-package repositories with git and npm.


install
--
```console
$ npm i -g lerna
/home/ec2-user/.nvm/versions/node/v10.16.1/bin/lerna -> /home/ec2-user/.nvm/versions/node/v10.16.1/lib/node_modules/lerna/cli.js
+ lerna@3.16.4
added 697 packages from 375 contributors in 22.63s
```


```console
$ git init lerna-repo
Initialized empty Git repository in /home/ec2-user/lerna-repo/.git/
```

```console
$ cd lerna-repo
```
```console
$ lerna init
lerna notice cli v3.16.4
lerna info Creating package.json
lerna info Creating lerna.json
lerna info Creating packages directory
lerna success Initialized Lerna files
```

```console
$ tree -F
.
├── lerna.json
├── package.json
└── packages/

1 directory, 2 files
```
