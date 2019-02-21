# serverless

https://github.com/serverless/serverless

## install

- require npm

```console
$ npm install -g serverless
/home/ec2-user/.nvm/versions/node/v11.10.0/bin/serverless -> /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/bin/serverless
/home/ec2-user/.nvm/versions/node/v11.10.0/bin/slss -> /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/bin/serverless
/home/ec2-user/.nvm/versions/node/v11.10.0/bin/sls -> /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/bin/serverless

> spawn-sync@1.0.15 postinstall /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/node_modules/spawn-sync
> node postinstall


> serverless@1.38.0 postinstall /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless
> node ./scripts/postinstall.js


[tabtab] Adding source line to load /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
in /home/ec2-user/.bashrc


[tabtab] Adding source line to load /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
in /home/ec2-user/.bashrc


[tabtab] Adding source line to load /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash
in /home/ec2-user/.bashrc

+ serverless@1.38.0
added 386 packages from 261 contributors in 16.94s
```

```console
$ serverless --version
1.38.0
$ sls --version
1.38.0
$ slss --version
1.38.0
```

```console
$ serverless create --template aws-nodejs --path my-app
Serverless: Generating boilerplate...
Serverless: Generating boilerplate in "/home/ec2-user/my-app"
 _______                             __
|   _   .-----.----.--.--.-----.----|  .-----.-----.-----.
|   |___|  -__|   _|  |  |  -__|   _|  |  -__|__ --|__ --|
|____   |_____|__|  \___/|_____|__| |__|_____|_____|_____|
|   |   |             The Serverless Application Framework
|       |                           serverless.com, v1.38.0
 -------'

Serverless: Successfully generated boilerplate for template: "aws-nodejs"
```

```console
$ tree my-app
my-app
├── handler.js
└── serverless.yml

0 directories, 2 files
```

```console
$ cat my-app/handler.js
'use strict';

module.exports.hello = async (event, context) => {
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event,
    }),
  };

  // Use this code if you don't use the http event with the LAMBDA-PROXY integration
  // return { message: 'Go Serverless v1.0! Your function executed successfully!', event };
};
```

```console
$ cat my-app/serverless.yml
```
```yml
# Welcome to Serverless!
#
# This file is the main config file for your service.
# It's very minimal at this point and uses default values.
# You can always add more config options for more control.
# We've included some commented out config examples here.
# Just uncomment any of them to get that config option.
#
# For full config options, check the docs:
#    docs.serverless.com
#
# Happy Coding!

service: my-app # NOTE: update this with your service name

# You can pin your service to only deploy with a specific Serverless version
# Check out our docs for more details
# frameworkVersion: "=X.X.X"

provider:
  name: aws
  runtime: nodejs8.10

# you can overwrite defaults here
#  stage: dev
#  region: us-east-1

# you can add statements to the Lambda function's IAM Role here
#  iamRoleStatements:
#    - Effect: "Allow"
#      Action:
#        - "s3:ListBucket"
#      Resource: { "Fn::Join" : ["", ["arn:aws:s3:::", { "Ref" : "ServerlessDeploymentBucket" } ] ]  }
#    - Effect: "Allow"
#      Action:
#        - "s3:PutObject"
#      Resource:
#        Fn::Join:
#          - ""
#          - - "arn:aws:s3:::"
#            - "Ref" : "ServerlessDeploymentBucket"
#            - "/*"

# you can define service wide environment variables here
#  environment:
#    variable1: value1

# you can add packaging information here
#package:
#  include:
#    - include-me.js
#    - include-me-dir/**
#  exclude:
#    - exclude-me.js
#    - exclude-me-dir/**

functions:
  hello:
    handler: handler.hello

#    The following are a few example events you can configure
#    NOTE: Please make sure to change your handler code to work with those events
#    Check the event documentation for details
#    events:
#      - http:
#          path: users/create
#          method: get
#      - websocket: $connect
#      - s3: ${env:BUCKET}
#      - schedule: rate(10 minutes)
#      - sns: greeter-topic
#      - stream: arn:aws:dynamodb:region:XXXXXX:table/foo/stream/1970-01-01T00:00:00.000
#      - alexaSkill: amzn1.ask.skill.xx-xx-xx-xx
#      - alexaSmartHome: amzn1.ask.skill.xx-xx-xx-xx
#      - iot:
#          sql: "SELECT * FROM 'some_topic'"
#      - cloudwatchEvent:
#          event:
#            source:
#              - "aws.ec2"
#            detail-type:
#              - "EC2 Instance State-change Notification"
#            detail:
#              state:
#                - pending
#      - cloudwatchLog: '/aws/lambda/hello'
#      - cognitoUserPool:
#          pool: MyUserPool
#          trigger: PreSignUp

#    Define function environment variables here
#    environment:
#      variable2: value2

# you can add CloudFormation resource templates here
#resources:
#  Resources:
#    NewResource:
#      Type: AWS::S3::Bucket
#      Properties:
#        BucketName: my-new-bucket
#  Outputs:
#     NewOutput:
#       Description: "Description for the output"
#       Value: "Some output value"
```
