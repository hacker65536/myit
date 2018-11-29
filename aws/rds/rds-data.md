
https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html

>Currently, the Data API is only available in the US East (N. Virginia) Region. Link to rds-data.us-east-1.amazonaws.com using the HTTPS protocol to access the Data API.

cli

https://docs.aws.amazon.com/cli/latest/reference/rds-data/execute-sql.html

sample
```console
$ aws rds-data execute-sql --db-cluster-or-instance-arn arn:aws:rds:us-east-1:123456789012:cluster:mydbcluster \
--schema "" \
--database "mydatabase" --aws-secret-store-arn "arn:aws:secretsmanager:us-east-1:123456789012:secret:mysecret" \
--sql-statements "select * from mytable" --region us-east-1 --no-verify-ssl \
--endpoint-url https://rds-data.us-east-1.amazonaws.com --profile myprofile
```      
