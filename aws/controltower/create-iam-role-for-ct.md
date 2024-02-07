

# Create IAM Role for Control Tower


## Cloudformation

https://docs.aws.amazon.com/ja_jp/controltower/latest/userguide/enroll-account.html#automated-account-enrollment

```yaml
AWSTemplateFormatVersion: 2010-09-09
Description: Configure the AWSControlTowerExecution role to enable use of your
  account as a target account in AWS CloudFormation StackSets.
Parameters:
  AdministratorAccountId:
    Type: String
    Description: AWS Account Id of the administrator account (the account in which
      StackSets will be created).
    MaxLength: 12
    MinLength: 12
Resources:
  ExecutionRole:
    Type: AWS::IAM::Role
    Properties:
      RoleName: AWSControlTowerExecution
      AssumeRolePolicyDocument:
        Version: 2012-10-17
        Statement:
          - Effect: Allow
            Principal:
              AWS:
                - !Ref AdministratorAccountId
            Action:
              - sts:AssumeRole
      Path: /
      ManagedPolicyArns:
        - !Sub arn:${AWS::Partition}:iam::aws:policy/AdministratorAccess
```

## cli

```bash
aws iam get-role --role-name AWSControlTowerExecution

ACCOUNTID=<MNG_ACCOUNT>
aws iam create-role --role-name AWSControlTowerExecution --assume-role-policy-document file://<(jq -c -n '$ARGS.named' --arg Version "2012-10-17" --argjson Statement $(jq -c -n '$ARGS.named' --arg Action "sts:AssumeRole" --arg Effect "Allow" --arg Sid "" --argjson Principal "{\"AWS\":\"arn:aws:iam::${ACCOUNTID}:root\"}"))
aws iam attach-role-policy --role-name AWSControlTowerExecution --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```
