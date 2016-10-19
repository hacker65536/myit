
https://github.com/aws/amazon-ecs-cli

#install 
```bash
wget "https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest"
wget "https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5"

cat https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5

md5sum ecs-cli-linux-amd64-latest.md5 >ecsclimd5
md5sum -c ecsclimd5

mv ecs-cli-linux-amd64-latest /usr/local/bin/ecs-cli
chmod +x /usr/local/bin/ecs-cli
```
