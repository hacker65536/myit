#repoquery

##install
```bash
yum -y install yum-utils
```


##example
```
 repoquery -l yum-utils
 
/etc/bash_completion.d
/etc/bash_completion.d/yum-utils.bash
/usr/bin/debuginfo-install
/usr/bin/find-repos-of-install
/usr/bin/needs-restarting
/usr/bin/package-cleanup
/usr/bin/repo-graph
/usr/bin/repo-rss
...
```

like as this command
```bash
rpm -ql
```

##options

- -i show general information about package similarly to "rpm -qi"
- -l list files in package.
- -s show package source rpm name.
