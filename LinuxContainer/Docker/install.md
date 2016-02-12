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
