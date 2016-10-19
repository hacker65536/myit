
https://github.com/aws/amazon-ecs-cli

#install 
```bash
wget "https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest"
wget "https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5"

cat https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5

md5sum ecs-cli-linux-amd64-latest.md5 >ecsclimd5
md5sum -c ecsclimd5

mv ecs-cli-linux-amd64-latest /usr/local/bin/ecs-cli
chmod +x /usr/local/bin/ecs-cli
```

#configure

```
ecs-cli help configure
NAME:
   configure - Configures your AWS credentials, the AWS region to use, and the ECS cluster name to use with the Amazon ECS CLI. The resulting configuration is stored in the ~/.ecs/config file.

USAGE:
   command configure [command options] [arguments...]

OPTIONS:
   --region, -r                                         Specifies the AWS region to use. If the AWS_REGION environment variable is set when ecs-cli configure is run, then the AWS region is set to the value of that environment variable. [$AWS_REGION]
   --access-key                                         Specifies the AWS access key to use. If the AWS_ACCESS_KEY_ID environment variable is set when ecs-cli configure is run, then the AWS access key ID is set to the value of that environment variable. [$AWS_ACCESS_KEY_ID]
   --secret-key                                         Specifies the AWS secret key to use. If the AWS_SECRET_ACCESS_KEY environment variable is set when ecs-cli configure is run, then the AWS secret access key is set to the value of that environment variable. [$AWS_SECRET_ACCESS_KEY]
   --profile, -p                                        Specifies your AWS credentials with an existing named profile from ~/.aws/credentials. If the AWS_PROFILE environment variable is set when ecs-cli configure is run, then the AWS named profile is set to the value of that environment variable. [$AWS_PROFILE]
   --cluster, -c                                        Specifies the ECS cluster name to use. If the cluster does not exist, it is created when you try to add resources to it with the ecs-cli up command.
   --compose-project-name-prefix "ecscompose-"          [Optional] Specifies the prefix added to an ECS task definition created from a compose file. Format <prefix><project-name>.
   --compose-service-name-prefix "ecscompose-service-"  [Optional] Specifies the prefix added to an ECS service created from a compose file. Format <prefix><project-name>.
   --cfn-stack-name-prefix "amazon-ecs-cli-setup-"      [Optional] Specifies the prefix added to the AWS CloudFormation stack created on ecs-cli up. Format <prefix><cluster-name>.
```

```
ecs-cli configure -c mycluster
INFO[0000] Saved ECS CLI configuration for cluster (mycluster)
```
