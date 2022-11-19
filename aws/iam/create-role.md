
onliner
```
aws iam create-role --role-name awsbasichandson202211191 --assume-role-policy-document file://<(jq -c -n '$ARGS.named' --arg Version "2012-10-17" --argjson Statement $(jq -c -n '$ARGS.named' --arg Action "sts:AssumeRole" --arg Effect "Allow" --arg Sid "" --argjson Principal '{"Service":"ec2.amazonaws.com"}'))
```
