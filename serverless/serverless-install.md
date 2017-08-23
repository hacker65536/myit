```
npm install serverless -g
```

```
[ec2-user@ip-172-31-38-241 ~]$ sls create --template aws-nodejs --path my-service
Serverless: Generating boilerplate...
Serverless: Generating boilerplate in "/home/ec2-user/my-service"
 _______                             __
|   _   .-----.----.--.--.-----.----|  .-----.-----.-----.
|   |___|  -__|   _|  |  |  -__|   _|  |  -__|__ --|__ --|
|____   |_____|__|  \___/|_____|__| |__|_____|_____|_____|
|   |   |             The Serverless Application Framework
|       |                           serverless.com, v1.20.2
 -------'

Serverless: Successfully generated boilerplate for template: "aws-nodejs"
[ec2-user@ip-172-31-38-241 ~]$ cd !$
cd my-service
[ec2-user@ip-172-31-38-241 my-service]$ sls deploy -v --aws-profile myprofile
Serverless: Packaging service...
Serverless: Excluding development dependencies...
Serverless: Creating Stack...
Serverless: Checking Stack create progress...
CloudFormation - CREATE_IN_PROGRESS - AWS::CloudFormation::Stack - my-service-dev
CloudFormation - CREATE_IN_PROGRESS - AWS::S3::Bucket - ServerlessDeploymentBucket
CloudFormation - CREATE_IN_PROGRESS - AWS::S3::Bucket - ServerlessDeploymentBucket
CloudFormation - CREATE_COMPLETE - AWS::S3::Bucket - ServerlessDeploymentBucket
CloudFormation - CREATE_COMPLETE - AWS::CloudFormation::Stack - my-service-dev
Serverless: Stack create finished...
Serverless: Uploading CloudFormation file to S3...
Serverless: Uploading artifacts...
Serverless: Uploading service .zip file to S3 (409 B)...
Serverless: Validating template...
Serverless: Updating Stack...
Serverless: Checking Stack update progress...
CloudFormation - CREATE_COMPLETE - AWS::CloudFormation::Stack - my-service-dev
CloudFormation - UPDATE_IN_PROGRESS - AWS::CloudFormation::Stack - my-service-dev
CloudFormation - CREATE_IN_PROGRESS - AWS::IAM::Role - IamRoleLambdaExecution
CloudFormation - CREATE_IN_PROGRESS - AWS::IAM::Role - IamRoleLambdaExecution
CloudFormation - CREATE_IN_PROGRESS - AWS::Logs::LogGroup - HelloLogGroup
CloudFormation - CREATE_IN_PROGRESS - AWS::Logs::LogGroup - HelloLogGroup
CloudFormation - CREATE_COMPLETE - AWS::Logs::LogGroup - HelloLogGroup
CloudFormation - CREATE_COMPLETE - AWS::IAM::Role - IamRoleLambdaExecution
CloudFormation - CREATE_IN_PROGRESS - AWS::Lambda::Function - HelloLambdaFunction
CloudFormation - CREATE_IN_PROGRESS - AWS::Lambda::Function - HelloLambdaFunction
CloudFormation - CREATE_COMPLETE - AWS::Lambda::Function - HelloLambdaFunction
CloudFormation - CREATE_IN_PROGRESS - AWS::Lambda::Version - HelloLambdaVersionVhcOOTen5vlVGXLZKd8HSDhqhbtXL6ZNi2UUIPO74
CloudFormation - CREATE_IN_PROGRESS - AWS::Lambda::Version - HelloLambdaVersionVhcOOTen5vlVGXLZKd8HSDhqhbtXL6ZNi2UUIPO74
CloudFormation - CREATE_COMPLETE - AWS::Lambda::Version - HelloLambdaVersionVhcOOTen5vlVGXLZKd8HSDhqhbtXL6ZNi2UUIPO74
CloudFormation - UPDATE_COMPLETE_CLEANUP_IN_PROGRESS - AWS::CloudFormation::Stack - my-service-dev
CloudFormation - UPDATE_COMPLETE - AWS::CloudFormation::Stack - my-service-dev
Serverless: Stack update finished...
Service Information
service: my-service
stage: dev
region: us-east-1
stack: my-service-dev
api keys:
  None
endpoints:
  None
functions:
  hello: my-service-dev-hello

Stack Outputs
HelloLambdaFunctionQualifiedArn: arn:aws:lambda:us-east-1:000039619500:function:my-service-dev-hello:1
ServerlessDeploymentBucketName: my-service-dev-serverlessdeploymentbucket-700unicyx4rf
```

```
[ec2-user@ip-172-31-38-241 my-service]$ sls invoke -f hello
{
    "statusCode": 200,
    "body": "{\"message\":\"Go Serverless v1.0! Your function executed successfully!\",\"input\":{}}"
}
```

```
[ec2-user@ip-172-31-38-241 my-service]$ aws lambda invoke --function-name my-service-dev-hello --region us-east-1 --profile myprofile output
{
    "StatusCode": 200
}
[ec2-user@ip-172-31-38-241 my-service]$ cat output
{"statusCode":200,"body":"{\"message\":\"Go Serverless v1.0! Your function executed successfully!\",\"input\":{}}"}
```
