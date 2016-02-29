`gem install chef`

```
RDoc::Parser::Ruby failure around line 52 of
lib/specinfra/command/windows/base/service.rb
```

```
[root@ip-10-1-0-21 ~]# ruby --version
ruby 2.0.0p648 (2015-12-16) [x86_64-linux]
[root@ip-10-1-0-21 ~]# gem --version
2.0.14.1
```
solution
```
 gem install --no-rdoc  chef
```

