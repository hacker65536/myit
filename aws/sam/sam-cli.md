https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-using-pip.html

```
$ pip install --user --upgrade aws-sam-cli
```

```
$ sam --version
SAM CLI, version 0.10.0
```

```
$ whereis sam
sam: /home/ec2-user/.local/bin/sam
```

set path if don't adjust
```
$ python -m site --user-base
/home/ec2-user/.local
```
```
$ USER_BASE_PATH=$(python -m site --user-base)
```
```
$ export PATH=$PATH:$USER_BASE_PATH/bin
```

tutorial

```
$ mkdir sam
$ cd !$
```

```
$ sam init --runtime python3.6
[+] Initializing project structure...
[SUCCESS] - Read sam-app/README.md for further instructions on how to proceed
[*] Project initialization is now complete
```

```
$ cd sam-app
$ ls -la
total 16
drwxrwxr-x 4 ec2-user ec2-user   94 Dec 27 09:43 .
drwxrwxr-x 3 ec2-user ec2-user   21 Dec 27 09:34 ..
-rw-rw-r-- 1 ec2-user ec2-user 3730 Dec 27 09:34 .gitignore
drwxrwxr-x 2 ec2-user ec2-user   98 Dec 27 09:42 hello_world
-rw-rw-r-- 1 ec2-user ec2-user 6165 Dec 27 09:34 README.md
-rw-rw-r-- 1 ec2-user ec2-user 1679 Dec 27 09:34 template.yaml
drwxrwxr-x 3 ec2-user ec2-user   18 Dec 27 09:34 tests
```

```
$ sam build --use-container
2018-12-27 09:44:51 Starting Build inside a container
2018-12-27 09:44:51 Building resource 'HelloWorldFunction'

Fetching lambci/lambda:build-python3.6 Docker container image......
2018-12-27 09:44:52 Mounting /home/ec2-user/sam/sam-app/hello_world as /tmp/samcli/source:ro inside runtime container
Running PythonPipBuilder:ResolveDependencies
Running PythonPipBuilder:CopySource

Build Succeeded

Built Artifacts  : .aws-sam/build
Built Template   : .aws-sam/build/template.yaml

Commands you can use next
=========================
[*] Invoke Function: sam local invoke
[*] Package: sam package --s3-bucket <yourbucket>
```
```
$ sam local start-api
2018-12-27 09:45:38 Mounting HelloWorldFunction at http://127.0.0.1:3000/hello [GET]
2018-12-27 09:45:38 You can now browse to the above endpoints to invoke your functions. You do not need to restart/reload SAM CLI while working on your functions changes will be reflected instantly/automatically. You only need to restart SAM CLI if you update your AWS SAM template
2018-12-27 09:45:38  * Running on http://127.0.0.1:3000/ (Press CTRL+C to quit)
```

```
$ curl http://127.0.0.1:3000/hello
{"message": "hello world", "location": "111.111.111.111"}
```

```
$ sed -e 's/hello world/Hello World/g' -i hello_world/app.py
$ sam build --use-container
$ sam local start-api
```
```
$ curl http://127.0.0.1:3000/hello
{"message": "Hello World", "location": "111.111.111.111"}
```

```
$ aws s3 mb s3://bucketname
```

```
$ $ sam package \
>     --output-template-file packaged.yaml \
>     --s3-bucket bucketname
Uploading to 1629db5953be6641a340c059b25a3b9e  526106 / 526106.0  (100.00%)
Successfully packaged artifacts and wrote output template to file packaged.yaml.
Execute the following command to deploy the packaged template
aws cloudformation deploy --template-file /home/ec2-user/sam/sam-app/packaged.yaml --stack-name <YOUR STACK NAME>
```

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: 'sam-app

  Sample SAM Template for sam-app

  '
Globals:
  Function:
    Timeout: 3
Outputs:
  HelloWorldApi:
    Description: API Gateway endpoint URL for Prod stage for Hello World function
    Value:
      Fn::Sub: https://${ServerlessRestApi}.execute-api.${AWS::Region}.amazonaws.com/Prod/hello/
  HelloWorldFunction:
    Description: Hello World Lambda Function ARN
    Value:
      Fn::GetAtt:
      - HelloWorldFunction
      - Arn
  HelloWorldFunctionIamRole:
    Description: Implicit IAM Role created for Hello World function
    Value:
      Fn::GetAtt:
      - HelloWorldFunctionRole
      - Arn
Resources:
  HelloWorldFunction:
    Properties:
      CodeUri: s3://bucketname/1629db5953be6641a340c059b25a3b9e
      Environment:
        Variables:
          PARAM1: VALUE
      Events:
        HelloWorld:
          Properties:
            Method: get
            Path: /hello
          Type: Api
      Handler: app.lambda_handler
      Runtime: python3.6
    Type: AWS::Serverless::Function
Transform: AWS::Serverless-2016-10-31
```
