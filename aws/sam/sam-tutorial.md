
https://dev.classmethod.jp/cloud/aws/aws-serverless-application-model/

template.yaml
```yaml
AWSTemplateFormatVersion: '2010-09-09'
Transform: 'AWS::Serverless-2016-10-31'
Resources:
  MyFunction:
    Type: 'AWS::Serverless::Function'
    Properties:
      Handler: index.handler
      Runtime: nodojs6.10
```

on cloud9
```
$ aws cloudformation package --template-file template.yaml --output-template-file serverless-output.yaml --s3-bucket s3://<bucketname>
Uploading to 21534bad4e12ea3c441a313330a44487  1026 / 1026.0  (100.00%)
Successfully packaged artifacts and wrote output template to file serverless-output.yaml.
Execute the following command to deploy the packaged template
aws cloudformation deploy --template-file /home/ec2-user/environment/project/serverless-output.yaml --stack-name <YOUR STACK NAME>
```


serverless-output.yaml 
```yaml
AWSTemplateFormatVersion: '2010-09-09'
Resources:
  MyFunction:
    Properties:
      CodeUri: s3://<bucketname>/21534bac4e62ea3c441a2c19d0a4387
      Handler: index.handler
      Runtime: nodojs6.10
    Type: AWS::Serverless::Function
Transform: AWS::Serverless-2016-10-31
```
