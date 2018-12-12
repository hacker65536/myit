```
$ aws --version
aws-cli/2.0.0dev0 Python/2.7.14 Linux/4.14.77-81.59.amzn2.x86_64 botocore/1.12.48
```

```
$ aws rds describe-db-clusters --filters Name=db-cluster-id,Values=cluster1

Parameter validation failed:
Invalid type for parameter Filters[0].Values, value: cluster1, type: <type 'unicode'>, valid types: <type 'list'>, <type 'tuple'>
```

```
$ aws rds describe-db-clusters --filters Name=db-cluster-id,Values=[cluster1]
{
    "DBClusters": []
}
```
