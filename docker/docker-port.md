```
$ docker port --help

Usage:  docker port CONTAINER [PRIVATE_PORT[/PROTO]]

List port mappings or a specific mapping for the container

Options:
      --help   Print usage
```

```
$ docker port port-test
9090/tcp -> 0.0.0.0:32769
9191/tcp -> 0.0.0.0:32768

$ docker port a5399aafc726
9090/tcp -> 0.0.0.0:32769
9191/tcp -> 0.0.0.0:32768
```


```Dockerfile
FROM python:3.4

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI==2.0.8
WORKDIR /app
COPY app /app

EXPOSE 9090 9191
USER uwsgi

CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py" ,\
   "--callable", "app", "--stats" ,"0.0.0.0:9191"]
```
