```
$ aws cloudformation describe-stack-resources --stack-name ThreatDetectionWksp-Env-Setup | jq -rc '.[][]|[ .ResourceType,.PhysicalResourceId ]|@tsv'|sort
AWS::CloudTrail::Trail  threat-detection-wksp-trail
AWS::Events::Rule       threat-detection-wksp-guardduty-ec2-finding
AWS::Events::Rule       threat-detection-wksp-guardduty-finding-sshbruteforce
AWS::Events::Rule       threat-detection-wksp-guardduty-iam-finding
AWS::Events::Rule       threat-detection-wksp-macie-alert
AWS::IAM::Role  threat-detection-wksp-lambda-inspector-creation
AWS::IAM::Role  threat-detection-wksp-lambda-remediation
AWS::Lambda::Function   threat-detection-wksp-additional-configuration
AWS::Lambda::Function   threat-detection-wksp-remediation-inspector
AWS::Lambda::Function   threat-detection-wksp-remediation-nacl
AWS::Lambda::Permission ThreatDetectionWksp-Env-Setup-LambdaRemediationInspectInvokePermissions-1ODVHBRC21VHX
AWS::Lambda::Permission ThreatDetectionWksp-Env-Setup-LambdaRemediationNACLInvokePermissions-DA96XFMGJU2Q
AWS::S3::BucketPolicy   ThreatDetectionWksp-Env-Setup-LogBucketPolicy-1BS1VZ9SDBOT8
AWS::S3::Bucket threat-detection-wksp-000000000000-us-west-2-data
AWS::S3::Bucket threat-detection-wksp-000000000000-us-west-2-gd-threatlist
AWS::S3::Bucket threat-detection-wksp-000000000000-us-west-2-logs
AWS::SNS::Topic arn:aws:sns:us-west-2:000000000000:threat-detection-wksp
AWS::SNS::TopicPolicy   ThreatDetectionWksp-Env-Setup-DetectionSNSTopicPolicy-1ERMNPNMH4GCU
Custom::CustomResource  2018/12/26/[$LATEST]a3023987e6d8495a87cf0ae573d50ec2
```
