
```Dockerfile
From debian:wheezy
RUN apt-get update && apt-get install -y cowsay fortune
```


```
$ docker history test/cowsay-dockerfile
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
3dfbb8601b23        39 hours ago        /bin/sh -c apt-get update && apt-get insta...   42.2 MB
c72c50c45f17        3 weeks ago         /bin/sh -c #(nop)  CMD ["bash"]                 0 B
<missing>           3 weeks ago         /bin/sh -c #(nop) ADD file:6c63dbdde9330ed...   85.1 MB
```
