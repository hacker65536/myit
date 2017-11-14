
show list of privateIP from Tags.Name
```bash
aws ec2 describe-instances | \
jq -r '.Reservations[].Instances[] | select ((.Tags[]|select(.Key=="Name").Value) | contains("hostanem"))|.PrivateIpAddress' | \
sort
```
