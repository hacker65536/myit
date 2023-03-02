

https://docs.docker.com/engine/reference/builder/


`FROM [--platform=<platform>] <image> [AS <name>]`
  
```dockerfile
FROM --platform=linux/x86_64 amazonlinux:2


workdir /root
run yum install -y unzip gzip vim-enhanced less
run curl -SsL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install
```
