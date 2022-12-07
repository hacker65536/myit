
```dockerfile
FROM amazonlinux:2

RUN yum -y install glibc-locale-source glibc-langpack-en gzip tar
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"
```

```
docker build -t amz2 .
```
