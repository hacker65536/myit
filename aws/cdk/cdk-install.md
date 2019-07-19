# cdk
https://github.com/aws/aws-cdk


require node


preinstall
--

install nvm
```console
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```
```console
$ source ~/.bashrc
```
```console
$ nvm install --latest-npm --lts
```


install
--

install aws-cdk

```console
$ npm i -g aws-cdk
/home/ec2-user/.nvm/versions/node/v10.16.0/bin/cdk -> /home/ec2-user/.nvm/versions/node/v10.16.0/lib/node_modules/aws-cdk/bin/cdk

> core-js@2.6.9 postinstall /home/ec2-user/.nvm/versions/node/v10.16.0/lib/node_modules/aws-cdk/node_modules/core-js
> node scripts/postinstall || echo "ignore"

Thank you for using core-js ( https://github.com/zloirock/core-js ) for polyfilling JavaScript standard library!

The project needs your help! Please consider supporting of core-js on Open Collective or Patreon:
> https://opencollective.com/core-js
> https://www.patreon.com/zloirock

Also, the author of core-js ( https://github.com/zloirock ) is looking for a good job -)

+ aws-cdk@1.0.0
added 243 packages from 246 contributors in 8.686s
```

```console
$ cdk --version
1.0.0 (build d89592e)
```

example
--

```console
$ cdk init sample-app --language=typescript
Applying project template sample-app for typescript
Initializing a new git repository...
Executing npm install...
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN cdk@0.1.0 No repository field.
npm WARN cdk@0.1.0 No license field.

# Useful commands

 * `npm run build`   compile typescript to js
 * `npm run watch`   watch for changes and compile
 * `cdk deploy`      deploy this stack to your default AWS account/region
 * `cdk diff`        compare deployed stack with current state
 * `cdk synth`       emits the synthesized CloudFormation template
```

```console
$ cdk deploy
This deployment will make potentially sensitive changes according to your current security approval level (--require-approval broadening).
Please confirm you intend to make the following modifications:

IAM Statement Changes
┌───┬─────────────────┬────────┬─────────────────┬───────────────────────────┬─────────────────────────────────────────────────┐
│   │ Resource        │ Effect │ Action          │ Principal                 │ Condition                                       │
├───┼─────────────────┼────────┼─────────────────┼───────────────────────────┼─────────────────────────────────────────────────┤
│ + │ ${CdkQueue.Arn} │ Allow  │ sqs:SendMessage │ Service:sns.amazonaws.com │ "ArnEquals": {                                  │
│   │                 │        │                 │                           │   "aws:SourceArn": "${CdkTopic}"                │
│   │                 │        │                 │                           │ }                                               │
└───┴─────────────────┴────────┴─────────────────┴───────────────────────────┴─────────────────────────────────────────────────┘
(NOTE: There may be security-related changes not in this list. See http://bit.ly/cdk-2EhF7Np)

Do you wish to deploy these changes (y/n)? y
CdkStack: deploying...
CdkStack: creating CloudFormation changeset...
 0/6 | 6:19:33 AM | CREATE_IN_PROGRESS   | AWS::SNS::Topic        | CdkTopic (CdkTopic7E7E1214)
 0/6 | 6:19:34 AM | CREATE_IN_PROGRESS   | AWS::CDK::Metadata     | CDKMetadata
 0/6 | 6:19:34 AM | CREATE_IN_PROGRESS   | AWS::SQS::Queue        | CdkQueue (CdkQueueBA7F247D)
 0/6 | 6:19:34 AM | CREATE_IN_PROGRESS   | AWS::SNS::Topic        | CdkTopic (CdkTopic7E7E1214) Resource creation Initiated
 0/6 | 6:19:34 AM | CREATE_IN_PROGRESS   | AWS::SQS::Queue        | CdkQueue (CdkQueueBA7F247D) Resource creation Initiated
 1/6 | 6:19:34 AM | CREATE_COMPLETE      | AWS::SQS::Queue        | CdkQueue (CdkQueueBA7F247D)
 1/6 | 6:19:35 AM | CREATE_IN_PROGRESS   | AWS::CDK::Metadata     | CDKMetadata Resource creation Initiated
 2/6 | 6:19:36 AM | CREATE_COMPLETE      | AWS::CDK::Metadata     | CDKMetadata
 3/6 | 6:19:44 AM | CREATE_COMPLETE      | AWS::SNS::Topic        | CdkTopic (CdkTopic7E7E1214)
 3/6 | 6:19:47 AM | CREATE_IN_PROGRESS   | AWS::SNS::Subscription | CdkQueue/CdkStackCdkTopic7868E982 (CdkQueueCdkStackCdkTopic7868E9827092CD19)
 3/6 | 6:19:47 AM | CREATE_IN_PROGRESS   | AWS::SQS::QueuePolicy  | CdkQueue/Policy (CdkQueuePolicy9CB1D142)
 3/6 | 6:19:48 AM | CREATE_IN_PROGRESS   | AWS::SQS::QueuePolicy  | CdkQueue/Policy (CdkQueuePolicy9CB1D142) Resource creation Initiated
 3/6 | 6:19:48 AM | CREATE_IN_PROGRESS   | AWS::SNS::Subscription | CdkQueue/CdkStackCdkTopic7868E982 (CdkQueueCdkStackCdkTopic7868E9827092CD19) Resource creation Initiated
 4/6 | 6:19:48 AM | CREATE_COMPLETE      | AWS::SNS::Subscription | CdkQueue/CdkStackCdkTopic7868E982 (CdkQueueCdkStackCdkTopic7868E9827092CD19)
 5/6 | 6:19:48 AM | CREATE_COMPLETE      | AWS::SQS::QueuePolicy  | CdkQueue/Policy (CdkQueuePolicy9CB1D142)
 6/6 | 6:19:50 AM | CREATE_COMPLETE      | AWS::CloudFormation::Stack | CdkStack

 ✅  CdkStack

Stack ARN:
arn:aws:cloudformation:us-west-2:000000000000:stack/CdkStack/23be5410-a9ed-11e9-ab27-02f46dd00950
```

```console
$ cdk destroy 
Are you sure you want to delete: CdkStack (y/n)? y
CdkStack: destroying...
   0 | 6:24:57 AM | DELETE_IN_PROGRESS   | AWS::CloudFormation::Stack | CdkStack User Initiated
   0 | 6:24:59 AM | DELETE_IN_PROGRESS   | AWS::SQS::QueuePolicy  | CdkQueue/Policy (CdkQueuePolicy9CB1D142)
   0 | 6:24:59 AM | DELETE_IN_PROGRESS   | AWS::CDK::Metadata     | CDKMetadata
   0 | 6:24:59 AM | DELETE_IN_PROGRESS   | AWS::SNS::Subscription | CdkQueue/CdkStackCdkTopic7868E982 (CdkQueueCdkStackCdkTopic7868E9827092CD19)
   1 | 6:24:59 AM | DELETE_COMPLETE      | AWS::SQS::QueuePolicy  | CdkQueue/Policy (CdkQueuePolicy9CB1D142)
   2 | 6:24:59 AM | DELETE_COMPLETE      | AWS::SNS::Subscription | CdkQueue/CdkStackCdkTopic7868E982 (CdkQueueCdkStackCdkTopic7868E9827092CD19)
   2 | 6:25:00 AM | DELETE_IN_PROGRESS   | AWS::SQS::Queue        | CdkQueue (CdkQueueBA7F247D)
   2 | 6:25:00 AM | DELETE_IN_PROGRESS   | AWS::SNS::Topic        | CdkTopic (CdkTopic7E7E1214)
   3 | 6:25:00 AM | DELETE_COMPLETE      | AWS::CDK::Metadata     | CDKMetadata
   4 | 6:25:01 AM | DELETE_COMPLETE      | AWS::SNS::Topic        | CdkTopic (CdkTopic7E7E1214)
  4 Currently in progress: CdkStack, CdkQueueBA7F247D

 ✅  CdkStack: destroyed
```
