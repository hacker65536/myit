find db cluster with prefix
```console
$ prefx=xxx
$ aws rds describe-db-clusters --query 'DBClusters[?starts_with(DBClusterIdentifier,`$prefix`)].DBClusterIdentifier'
```
