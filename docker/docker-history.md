
```Dockerfile
From debian:wheezy
RUN apt-get update && apt-get install -y cowsay fortune
```


```
$ docker history --no-trunc test/cowsay-dockerfile
IMAGE                                                                     CREATED             CREATED BY                                                                                          SIZE                COMMENT
sha256:3dfbb8601b23874891bc50aba938a0a1d1ca08e23390fefb5c15a9363953a69c   39 hours ago        /bin/sh -c apt-get update && apt-get install -y cowsay fortune                                      42.2 MB
sha256:c72c50c45f174c60a21d9a692d3d6061cc7ce93bb6505879387c06369a48a76f   3 weeks ago         /bin/sh -c #(nop)  CMD ["bash"]                                                                     0 B
<missing>                                      
```
