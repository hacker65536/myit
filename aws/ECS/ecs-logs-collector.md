http://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/ecs-logs-collector.html

```
curl -O https://raw.githubusercontent.com/awslabs/ecs-logs-collector/master/ecs-logs-collector.sh
```
```
sudo bash ./ecs-logs-collector.sh
```

```
aws s3 cp ./collect.tgz s3://mybucket/$(curl http://169.254.169.254/latest/meta-data/instance-id)-collect.tgz
```
