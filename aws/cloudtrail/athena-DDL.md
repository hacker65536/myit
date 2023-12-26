```sql
CREATE EXTERNAL TABLE [TABLE_NAME] (
    eventVersion STRING,
    userIdentity STRUCT<
        type: STRING,
        principalId: STRING,
        arn: STRING,
        accountId: STRING,
        invokedBy: STRING,
        accessKeyId: STRING,
        userName: STRING,
        sessionContext: STRUCT<
            attributes: STRUCT<
                mfaAuthenticated: STRING,
                creationDate: STRING>,
            sessionIssuer: STRUCT<
                type: STRING,
                principalId: STRING,
                arn: STRING,
                accountId: STRING,
                username: STRING>,
            ec2RoleDelivery: STRING,
            webIdFederationData: MAP<STRING,STRING>>>,
    eventTime STRING,
    eventSource STRING,
    eventName STRING,
    awsRegion STRING,
    sourceIpAddress STRING,
    userAgent STRING,
    errorCode STRING,
    errorMessage STRING,
    requestParameters STRING,
    responseElements STRING,
    additionalEventData STRING,
    requestId STRING,
    eventId STRING,
    resources ARRAY<STRUCT<
        arn: STRING,
        accountId: STRING,
        type: STRING>>,
    eventType STRING,
    apiVersion STRING,
    readOnly STRING,
    recipientAccountId STRING,
    serviceEventDetails STRING,
    sharedEventID STRING,
    vpcEndpointId STRING,
    tlsDetails STRUCT<
        tlsVersion: STRING,
        cipherSuite: STRING,
        clientProvidedHostHeader: STRING>
)
COMMENT 'CloudTrail table for [S3_BUCKET_NAME] bucket'
PARTITIONED BY (
accountid string,
region string,
date string)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS INPUTFORMAT 'com.amazon.emr.cloudtrail.CloudTrailInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://[S3_BUCKET_NAME]/[ORG_ID]AWSLogs/[ORG_ID]'
TBLPROPERTIES (
    'projection.enabled' = 'true',
    'projection.date.type' = 'date',
    'projection.date.range' = 'NOW-2YEARS,NOW',
    'projection.date.format' = 'yyyy/MM/dd',
    'projection.date.interval' = '1',
    'projection.date.interval.unit' = 'DAYS',
    'projection.region.type' = 'enum',
    'projection.accountid.type' = 'injected',
    'projection.region.values'='us-east-1,us-east-2,us-west-1,us-west-2,af-south-1,ap-east-1,ap-south-1,ap-northeast-2,ap-southeast-1,ap-southeast-2,ap-northeast-1,ca-central-1,eu-central-1,eu-west-1,eu-west-2,eu-south-1,eu-west-3,eu-north-1,me-south-1,sa-east-1',
    'storage.location.template' = 's3://[S3_BUCKET_NAME]/[ORG_ID]AWSLogs/[ORG_ID]/${accountid}/CloudTrail/${region}/${date}',
    'classification'='cloudtrail',
    'compressionType'='gzip',
    'typeOfData'='file',
  'classification'='cloudtrail'
);
```
