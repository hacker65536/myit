locally codebuild
===============


env
--------

```
$ cat /etc/system-release
Amazon Linux release 2 (2017.12) LTS Release Candidate
$ uname -r
4.14.26-54.32.amzn2.x86_64
```

init
---------

```
sudo yum install -y docker git
sudo systemctl start docker
sudo usermod  -a -G docker ec2-user
newgrp docker
```

build codebuild image locally
-----------

```bash
git clone https://github.com/aws/aws-codebuild-docker-images.git
cd !$:t:r/ubuntu/java/openjdk-8
sed -e '$d' -i Dockerfile  # remove last line ENTRYPOINT ["dockerd-entrypoint.sh"]
docker build -t aws/codebuild/java:openjdk-8 .
```


