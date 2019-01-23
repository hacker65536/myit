```
$ aws rds describe-db-instances --query 'DBInstances[?DBSubnetGroup.VpcId==`vpc-xxxxx`]'
```
