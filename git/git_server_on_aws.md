

##require jq

[install jq](https://github.com/hacker65536/myit/blob/master/javascript/jq.md)

##attach ebs

```bash
ebssize=20
thisAz=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.availabilityZone'| tr -d '\"')
thisReg=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.region' | tr -d '\"')
thisId=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.instanceId'|tr -d '"')
vid=$(aws ec2 create-volume --size ${ebssize} --volume-type gp2 --avaliability-zone ${thisAz} --region ${thisReg} | jq '.VolumeId'| tr -d '"')
aws ec2 attach-volume --volume-id ${vid} --instance-id ${thisId} --device /dev/sdf --region ${thisReg}

sleep 15
```
