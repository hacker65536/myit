

```
$ aws --profile myprofile rds describe-db-instances | 
jq -rc '.[][]| [.DBInstanceIdentifier, .Engine, .EngineVersion, .DBInstanceClass, .AllocatedStorage, .DBInstanceStatus, .MultiAZ , .AvailabilityZone, .DBSubnetGroup["VpcId"] , .VpcSecurityGroups[].VpcSecurityGroupId,  .DeletionProtection, .AutoMinorVersionUpgrade , .Endpoint["Address"], .MasterUsername ]|@csv'
```
