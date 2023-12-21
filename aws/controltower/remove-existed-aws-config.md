

https://docs.aws.amazon.com/ja_jp/controltower/latest/userguide/enroll-account.html

```
aws configservice describe-delivery-channels

aws configservice describe-delivery-channel-status

aws configservice describe-configuration-recorders
```

check config of all regions 
```
aws ec2 describe-regions --query '*[*].RegionName.[@]' --output text | xargs -I{} bash -c "echo {}; export AWS_REGION={}; aws configservice describe-delivery-channels"
```


```
aws configservice stop-configuration-recorder --configuration-recorder-name default

aws configservice delete-delivery-channel --delivery-channel-name default

aws configservice delete-configuration-recorder --configuration-recorder-name default
```
