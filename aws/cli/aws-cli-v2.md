
https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html


```
cd
yum install -y unzip gzip vim-enhanced less
curl -SsL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
```

udpate
```
./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
```
