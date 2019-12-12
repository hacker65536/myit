
```console
$ sudo yum --showduplicates list vim-common
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Installed Packages
vim-common.x86_64                         2:8.1.1602-1.amzn2                             installed
Available Packages
vim-common.x86_64                         2:7.4.160-2.amzn2                              amzn2-core
vim-common.x86_64                         2:7.4.160-4.amzn2.0.16                         amzn2-core
vim-common.x86_64                         2:8.0.1257-1.amzn2                             amzn2extra-vim
vim-common.x86_64                         2:8.0.1257-2.amzn2                             amzn2extra-vim
vim-common.x86_64                         2:8.1.1602-1.amzn2                             amzn2-core
```


```console
$ yumdownloader --source vim-common-2:8.1.1602-1.amzn2.x86_64
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Enabling amzn2extra-vim-source repository
Enabling amzn2extra-docker-source repository
Enabling amzn2-core-source repository
vim-8.1.1602-1.amzn2.src.rpm                                                    |  11 MB  00:00:00
```


```console
$ rpm -ivh vim-8.1.1602-1.amzn2.src.rpm
```

```console
$ sudo yum-builddep rpmbuild/SPECS/vim.spec
```
