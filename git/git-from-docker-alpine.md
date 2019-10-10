# git (alpine docker)

https://github.com/alpine-docker/git/blob/master/Dockerfile

https://pkgs.alpinelinux.org/package/edge/main/x86/git

https://stackoverflow.com/questions/52899227/alpine-add-package-from-edge-repository


`git-2.23.0-r1`

```Dockerfile
FROM alpine

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk --update add git@testing less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

VOLUME /git
WORKDIR /git

ENTRYPOINT ["git"]
CMD ["--help"]
```


```
docker build -t git223 .
```

```
$ docker images git223
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
git223              latest              8905440c9148        5 minutes ago       28.9MB
```

```
alias git="docker run -ti --rm -v $(pwd):/git -v $HOME/.ssh:/root/.ssh git223"
```

```
$ git --version
git version 2.23.0
```
