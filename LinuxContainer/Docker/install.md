#Docker installation

##env
```bash
uname -r
4.1.10-17.31.amzn1.x86_64
```

##install
```bash
sudo yum install -y docker
```

start daemon
```bash
sudo service docker start
```
add the ec2-user to the docker group for execute commands without using sudo 
```bash
sudo usermod -a -G docker ec2-user
```
show docker info
```bash
docker info
```


##tutorial

create a docker image and upload it to docker hub

```bash
git clone https://github.com/awslabs/ecs-demo-php-simple-app
cd ecs-demo-php-simple-app
cat Dockerfile
```

Dockerfile
```
FROM ubuntu:12.04

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y git curl apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysql

# Install app
RUN rm -rf /var/www/*
ADD src /var/www

# Configure apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
```
```bash
docker build -t your-dockerhub-username/amazon-ecs-sample .
```

```
Sending build context to Docker daemon   363 kB
Step 1 : FROM ubuntu:12.04

---snip---

Removing intermediate container 97f51808e010
Successfully built 90a9e4833634
```



```bash
docker images
```
```
REPOSITORY                      TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
hacker65536/amazon-ecs-sample   latest              90a9e4833634        39 minutes ago      262.2 MB

```
