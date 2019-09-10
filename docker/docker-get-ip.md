https://stackoverflow.com/questions/17157721/how-to-get-a-docker-containers-ip-address-from-the-host


```
$ docker inspect -f '{{.Name}} - {{.NetworkSettings.IPAddress }}' $(docker ps -aq)
```
