```
$ aws ec2 describe-images \
--filters "Name=description,Values=CoreOS Container Linux stable*" \
Name=is-public,Values=true \
Name=virtualization-type,Values=hvm \
Name=root-device-type,Values=ebs | \
jq  '.[] | sort_by(.CreationDate) | reverse |.[0,1,2,3]'
```
