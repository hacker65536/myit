
https://locust.io/

install
----

```bash
pip install locustio
```

locustfile.py
```python
from locust import HttpLocust, TaskSet

def login(l):
    l.client.post("/login", {"username":"ellen_key", "password":"education"})

def index(l):
    l.client.get("/")

def profile(l):
    l.client.get("/profile")

class UserBehavior(TaskSet):
    tasks = {index: 2, profile: 1}

    def on_start(self):
        login(self)

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 5000
    max_wait = 9000
```

```
locust -H http://remotehost.com
```


access http://127.0.0.1:8089


docker 
-----------

```Dockerfile
FROM python:2.7-alpine
RUN apk add --no-cache --virtual .builddeps alpine-sdk && \
    pip install locustio pyzmq  && \
    apk del .builddeps && \
    mkdir /locust
Add locustfile.py /locust/locustfile.py
EXPOSE 5557 5558 8089
ENTRYPOINT ["/usr/local/bin/locust", "-f", "/locust/locustfile.py"]
```

```
docker build . -t customlocust
docker run -d -p 8089:8089 customlocust -H http://xxxxxxxx.us-east-2.elb.amazonaws.com
```
