

# RI status

## opensearch(es)
```
aws opensearch describe-reserved-instances --query '*[*].[ReservationName,InstanceType,InstanceCount,StartTime,Duration]' --output text | gawk -v date="$(date +%s)" '{("gdate +%s -d \"" $4 " +  " $5 " sec\"" )|getline t;("gdate --iso-8601=seconds -d \"" $4 " +  " $5 " sec\"" )|getline d;if(t >date) {print $1" "$2" "$3" "d}}' | sort -k 4,4 | column -t -N "name,type,num,end"
```

## elasticsearch
```
aws elasticache describe-reserved-cache-nodes --query '*[*].[ReservedCacheNodeId,CacheNodeType,CacheNodeCount,StartTime,Duration]' --output text | gawk -v date="$(date +%s)" '{("gdate +%s -d \"" $4 " +  " $5 " sec\"" )|getline t;("gdate --iso-8601=seconds -d \"" $4 " +  " $5 " sec\"" )|getline d;if(t >date) {print $1" "$2" "$3" "d}}' | sort -k 4,4 | column -t -N "name,type,num,end"
```

## rds
```
aws rds describe-reserved-db-instances --query  '*[*].[ReservedDBInstanceId,DBInstanceClass,DBInstanceCount,StartTime,Duration]' --output text | gawk -v date="$(date +%s)" '{("gdate +%s -d \"" $4 " +  " $5 " sec\"" )|getline t;("gdate --iso-8601=seconds -d \"" $4 " +  " $5 " sec\"" )|getline d;if(t >date) {print $1" "$2" "$3" "d}}' | sort -k 4,4 | column -t -N "name,type,num,end"
```
