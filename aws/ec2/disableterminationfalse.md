
```bash
#!/bin/env bash
instances=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text)



termination_enabled_instances=$(echo $instances | xargs -n 1 -P 20 -I {} aws ec2 describe-instance-attribute --instance-id {} --attribute disableApiTermination --query '[InstanceId,DisableApiTermination.Value]' --output text)


# echo "$termination_enabled_instances"

for i in $(echo "$termination_enabled_instances" | grep True | awk '{print $1}') ; do
  echo $i
  aws ec2 modify-instance-attribute --instance-id $i --no-disable-api-termination
done
```