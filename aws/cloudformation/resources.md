
``` 
$ aws cloudformation describe-stack-resources \
--stack-name ThreatDetectionWksp-Env-Setup | \
jq -rc '.[][]|[.ResourceType, .LogicalResourceId,.PhysicalResourceId]|@tsv'

AWS::CloudTrail::Trail  CloudTrail      threat-detection-wksp-trail
AWS::S3::Bucket DataBucket      threat-detection-wksp-000000000000-us-west-2-data
AWS::SNS::Topic DetectionSNSTopic       arn:aws:sns:us-west-2:000000000000:threat-detection-wksp
AWS::SNS::TopicPolicy   DetectionSNSTopicPolicy ThreatDetectionWksp-Env-Setup-DetectionSNSTopicPolicy-15LFXUUIFKP67
AWS::S3::Bucket GDThreatListBucket      threat-detection-wksp-000000000000-us-west-2-gd-threatlist
AWS::Events::Rule       GuardDutyEC2FindingEvent        threat-detection-wksp-guardduty-ec2-finding
AWS::Events::Rule       GuardDutyFindingEventSSHBruteForce      threat-detection-wksp-guardduty-finding-sshbruteforce
AWS::Events::Rule       GuardDutyIAMFindingEvent        threat-detection-wksp-guardduty-iam-finding
Custom::CustomResource  InspectorCustomResource 2018/12/28/[$LATEST]671bd6b4b831441fa92c12a5cbcd7273
AWS::Lambda::Function   LambdaAdditionalConfig  threat-detection-wksp-additional-configuration
AWS::IAM::Role  LambdaAdditionalConfigRole      threat-detection-wksp-lambda-inspector-creation
AWS::Lambda::Permission LambdaRemediationInspectInvokePermissions       ThreatDetectionWksp-Env-Setup-LambdaRemediationInspectInvokePermissions-4U437AVB9UH9
AWS::Lambda::Function   LambdaRemediationInspector      threat-detection-wksp-remediation-inspector
AWS::Lambda::Function   LambdaRemediationNACL   threat-detection-wksp-remediation-nacl
AWS::Lambda::Permission LambdaRemediationNACLInvokePermissions  ThreatDetectionWksp-Env-Setup-LambdaRemediationNACLInvokePermissions-14YZRJWZLNRP3
AWS::IAM::Role  LambdaRemediationRole   threat-detection-wksp-lambda-remediation
AWS::S3::Bucket LogBucket       threat-detection-wksp-000000000000-us-west-2-logs
AWS::S3::BucketPolicy   LogBucketPolicy ThreatDetectionWksp-Env-Setup-LogBucketPolicy-12YFAHMQ6IPL5
AWS::Events::Rule       MacieAlertEvent threat-detection-wksp-macie-alert

```
