

aws acm request-certificate

```
$ aws acm request-certificate --domain-name *.mydomain.com
{
    "CertificateArn": "arn:aws:acm:ap-northeast-1:00000000000:certificate/00000000-0000-0000-0000-0000000000000"
}
```

prepare

ses  
region->oregon


verify a new domain -> mydomain.com

use route53 -> create record sets

email receiving -> rule set 

imput domainname

configure s3 bucket

stop rule set -> sns topic





```bash
#!/bin/bash


validationdomain="mydomain.com"
# get namespace from environament
pushd ../route53/
subdomain=$(terraform workspace show)
popd
domain="*.${subdomain}.${validationdomain}"



#echo $subdomain
aws acm request-certificate --domain-name ${domain} --domain-validation-options DomainName=${domain},ValidationDomain=${validationdomain}
```



```bash
#!/bin/bash

set -e

bucket="s3://acm-mydomain-bucket/key/"


obj=$(aws s3 ls ${bucket} | sort -nr |head -1 | awk '{print $4}')
aws s3 cp ${bucket}${obj} . >/dev/null 2>&1
grep -E "https.*certificates.*approvals\?code" $obj
rm  $obj
```
```
https://ap-northeast-1.certificates.amazon.com/approvals?code=00000000-0000-0000-0000-0000000000000&context=0000000-0000-0000-0000-000000000-00000000000000000000
```
