#!/bin/bash


tg="arn:aws:elasticloadbalancing:ap-northeast-1:012345678912:targetgroup/alb/xxxxxxxxxx"

instances=$(aws elbv2 describe-target-health --target-group-arn $tg --query 'TargetHealthDescriptions[*].Target.Id' --output text)

join <(aws elbv2 describe-target-health --target-group-arn $tg --query 'TargetHealthDescriptions[*].{id: Target.Id,health: TargetHealth.State}'| jq -rc '.[]|[.id,.health]|@tsv'|sort) \
  <(aws ec2 describe-instances --instance-id ${instances} --query 'Reservations[*].Instances[*].{id: InstanceId, create: LaunchTime,ip: PrivateIpAddress,tag: Tags[?Key==`Name`].Value|[0]}'|  jq -r  '.[][]|.create |= .[:-6]+"Z"|.create|=fromdate+32400|.create|=strftime("%Y-%m-%dT%H:%M:%S%Z")|[.id,.ip,.create,.tag]|@tsv' | sort)
