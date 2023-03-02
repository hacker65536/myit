
```dockerfile
FROM --platform=linux/x86_64 amazonlinux:2


workdir /root
run yum install -y unzip gzip vim-enhanced less
run curl -SsL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install
copy ./config /root/.aws/config
```

```bash
docker build -t myamzlinux2 . -f myamzlinux2
```

```
mkdir -p ~/ssoenv/sso/
alias maz2='docker run --rm -it --platform linux/x86_64 -v $HOME/ssoenv/sso/:/root/.aws/sso/ myamzlinux2 bash'
```
