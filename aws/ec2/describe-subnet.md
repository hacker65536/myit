
```
aws ec2 describe-subnets --query 'Subnets[].{tag: Tags[?Key==`Name`].Value[][]|[0]|to_string(@) ,id: SubnetId,ip: AvailableIpAddressCount,az: AvailabilityZone}' | jq -rc '.[]|[.id,.az,.ip,.tag]|@tsv' | expand -t28,35,45,52|sort -n -r -k 3
```
