https://awslabs.github.io/aws-cdk/versions/0.8.0/


```console
$ sudo npm install -g aws-cdk
/usr/bin/cdk -> /usr/lib/node_modules/aws-cdk/bin/cdk
+ aws-cdk@0.8.0
updated 1 package in 9.293s
```

```console
$ cdk --version
0.8.0 (build bb95676)
```


```
$ mkdir hello-cdk
$ cd !$
```
```
$ git init
Initialized empty Git repository in /home/ec2-user/awscdk/hello-cdk/.git/
```
```
$ npm init -y
Wrote to /home/ec2-user/awscdk/hello-cdk/package.json:

{
  "name": "hello-cdk",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

```
$ npm install @aws-cdk/cdk
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN hello-cdk@1.0.0 No description
npm WARN hello-cdk@1.0.0 No repository field.

+ @aws-cdk/cdk@0.8.0
added 10 packages from 7 contributors and audited 10 packages in 0.967s
found 0 vulnerabilities
```

index.js
```js
const cdk = require('@aws-cdk/cdk');

class MyApp extends cdk.App {
    constructor(argv) {
        super(argv);
    }
}

process.stdout.write(new MyApp(process.argv).run());
```

cdk.json
```json
{
  "app": "node index.js"
}
```

```console
$ cdk ls -l
[]
```

index.js
```js
const cdk = require('@aws-cdk/cdk');

class MyStack extends cdk.Stack {
    constructor(parent, id, props) {
        super(parent, id, props);
    }
}

class MyApp extends cdk.App {
    constructor(argv) {
        super(argv);

        new MyStack(this, 'hello-cdk');
    }
}

process.stdout.write(new MyApp(process.argv).run());
```

configure aws auth
```
$ aws configure 
```
or
```
$ export AWS_ACCESS_KEY_ID=AKIAI44QH8DHBEXAMPLE
$ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$ export AWS_SESSION_TOKEN=AQoDYXdzEJr...<remainder of security token>
$ export AWS_DEFAULT_REGION=us-east-2
```
```console
$ cdk ls -l
-
    name: hello-cdk
    environment:
        name: xxxxxxxx/us-east-2
        account: 'xxxxxxxx'
        region: us-east-2

```

```console
$ npm install @aws-cdk/aws-s3
npm WARN hello-cdk@1.0.0 No description
npm WARN hello-cdk@1.0.0 No repository field.

+ @aws-cdk/aws-s3@0.8.0
added 3 packages from 1 contributor and audited 54 packages in 0.927s
found 0 vulnerabilities
```

index.js
```js
const cdk = require('@aws-cdk/cdk');
const s3 = require('@aws-cdk/aws-s3');

class MyStack extends cdk.Stack {
    constructor(parent, id, props) {
        super(parent, id, props);

        new s3.Bucket(this, 'MyFirstBucket', {
            versioned: true
        });
    }
}

class MyApp extends cdk.App {
    constructor(argv) {
        super(argv);

        new MyStack(this, 'hello-cdk');
    }
}

process.stdout.write(new MyApp(process.argv).run());
```


```console
$ cdk synth hello-cdk
```
```yml
Resources:
    MyFirstBucketB8884501:
        Type: 'AWS::S3::Bucket'
        Properties:
            VersioningConfiguration:
                Status: Enabled
    CDKMetadata:
        Type: 'AWS::CDK::Metadata'
        Properties:
            Modules: '@aws-cdk/aws-kms=0.8.0,@aws-cdk/aws-s3=0.8.0,@aws-cdk/cdk=0.8.0,@aws-cdk/cx-api=0.8.0,hello-cdk=1.0.0,js-base64=2.4.5'
```
```console
$ cdk deploy
 ⏳  Starting deployment of stack hello-cdk...
[0/2] Tue Aug 07 2018 10:50:51 GMT+0000 (Coordinated Universal Time)  CREATE_IN_PROGRESS  [AWS::CloudFormation::WaitConditionHandle] WaitCondition
[0/2] Tue Aug 07 2018 10:50:51 GMT+0000 (Coordinated Universal Time)  CREATE_IN_PROGRESS  [AWS::CloudFormation::WaitConditionHandle] WaitCondition Resource creation Initiated
[1/2] Tue Aug 07 2018 10:50:51 GMT+0000 (Coordinated Universal Time)  CREATE_COMPLETE     [AWS::CloudFormation::WaitConditionHandle] WaitCondition
[2/2] Tue Aug 07 2018 10:50:53 GMT+0000 (Coordinated Universal Time)  CREATE_COMPLETE     [AWS::CloudFormation::Stack] hello-cdk
[0/4] Tue Aug 07 2018 10:51:05 GMT+0000 (Coordinated Universal Time)  CREATE_IN_PROGRESS  [AWS::S3::Bucket] MyFirstBucketB8884501
[0/4] Tue Aug 07 2018 10:51:05 GMT+0000 (Coordinated Universal Time)  CREATE_IN_PROGRESS  [AWS::CDK::Metadata] CDKMetadata
[0/4] Tue Aug 07 2018 10:51:05 GMT+0000 (Coordinated Universal Time)  CREATE_IN_PROGRESS  [AWS::S3::Bucket] MyFirstBucketB8884501 Resource creation Initiated
[0/4] Tue Aug 07 2018 10:51:06 GMT+0000 (Coordinated Universal Time)  CREATE_IN_PROGRESS  [AWS::CDK::Metadata] CDKMetadata Resource creation Initiated
[1/4] Tue Aug 07 2018 10:51:07 GMT+0000 (Coordinated Universal Time)  CREATE_COMPLETE     [AWS::CDK::Metadata] CDKMetadata
[2/4] Tue Aug 07 2018 10:51:26 GMT+0000 (Coordinated Universal Time)  CREATE_COMPLETE     [AWS::S3::Bucket] MyFirstBucketB8884501
[2/4] Tue Aug 07 2018 10:51:28 GMT+0000 (Coordinated Universal Time)  UPDATE_COMPLETE_CLEANUP_IN_PROGRESS  [AWS::CloudFormation::Stack] hello-cdk
[2/4] Tue Aug 07 2018 10:51:29 GMT+0000 (Coordinated Universal Time)  DELETE_IN_PROGRESS  [AWS::CloudFormation::WaitConditionHandle] WaitCondition
[3/4] Tue Aug 07 2018 10:51:29 GMT+0000 (Coordinated Universal Time)  DELETE_COMPLETE     [AWS::CloudFormation::WaitConditionHandle] WaitCondition
[4/4] Tue Aug 07 2018 10:51:30 GMT+0000 (Coordinated Universal Time)  UPDATE_COMPLETE     [AWS::CloudFormation::Stack] hello-cdk
 ✅  Deployment of stack hello-cdk completed successfully, it has ARN arn:aws:cloudformation:us-east-2:xxxxxxxxxx:stack/hello-cdk/bd868410-9a2f-11e8-b99d-0aa0cd9d9f9c
```

index.js
```js
const cdk = require('@aws-cdk/cdk');
const s3 = require('@aws-cdk/aws-s3');

class MyStack extends cdk.Stack {
    constructor(parent, id, props) {
        super(parent, id, props);

        new s3.Bucket(this, 'MyFirstBucket', {
            versioned: true,
            encryption: s3.BucketEncryption.KmsManaged
        });
    }
}

class MyApp extends cdk.App {
    constructor(argv) {
        super(argv);

        new MyStack(this, 'hello-cdk');
    }
}

process.stdout.write(new MyApp(process.argv).run());
```

```console
$ cdk diff
[~] 🛠 Updating MyFirstBucketB8884501 (type: AWS::S3::Bucket)
 └─ [+] .BucketEncryption:
     └─ New value: {"ServerSideEncryptionConfiguration":[{"ServerSideEncryptionByDefault":{"SSEAlgorithm":"aws:kms"}}]}
```

```console
$ cdk deploy
 ⏳  Starting deployment of stack hello-cdk...
[0/2] Tue Aug 07 2018 10:55:19 GMT+0000 (Coordinated Universal Time)  UPDATE_IN_PROGRESS  [AWS::S3::Bucket] MyFirstBucketB8884501
[1/2] Tue Aug 07 2018 10:55:40 GMT+0000 (Coordinated Universal Time)  UPDATE_COMPLETE     [AWS::S3::Bucket] MyFirstBucketB8884501
[1/2] Tue Aug 07 2018 10:55:41 GMT+0000 (Coordinated Universal Time)  UPDATE_COMPLETE_CLEANUP_IN_PROGRESS  [AWS::CloudFormation::Stack] hello-cdk
[2/2] Tue Aug 07 2018 10:55:42 GMT+0000 (Coordinated Universal Time)  UPDATE_COMPLETE     [AWS::CloudFormation::Stack] hello-cdk
 ✅  Deployment of stack hello-cdk completed successfully, it has ARN arn:aws:cloudformation:us-east-2:xxxxxxxxxx:stack/hello-cdk/bd868410-9a2f-11e8-b99d-0aa0cd9d9f9c
```

```console
$ cdk destroy
Are you sure you want to delete: hello-cdk (y/n)? y
 ⏳  Starting destruction of stack hello-cdk...
 ✅  Stack hello-cdk successfully destroyed.
```
