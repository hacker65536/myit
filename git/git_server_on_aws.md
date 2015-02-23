

##require 

[install jq](https://github.com/hacker65536/myit/blob/master/javascript/jq.md)  
need IAMrole for ontrol EBS



##attach ebs

```bash
ebssize=20
thisAz=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.availabilityZone'| tr -d '\"')
thisReg=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.region' | tr -d '\"')
thisId=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.instanceId'|tr -d '"')
vid=$(aws ec2 create-volume --size ${ebssize} --volume-type gp2 --availability-zone ${thisAz} --region ${thisReg} | jq '.VolumeId'| tr -d '"')
aws ec2 attach-volume --volume-id ${vid} --instance-id ${thisId} --device /dev/xvdf --region ${thisReg}

sleep 15
```

```bash
lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
xvdf    202:80   0  20G  0 disk
```
