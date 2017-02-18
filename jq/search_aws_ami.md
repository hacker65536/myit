
ecs-optimized-ami
```
$ aws --region us-west-2 ec2 describe-images \
--filters \
"Name=virtualization-type,Values=hvm" \
"Name=root-device-type,Values=ebs" \
"Name=name,Values=amzn-ami-201*-amazon-ecs*" \
| jq '.[][]|sort_by(.CreationDate) | .[-1:] | .[].ImageId' -s -r
```
