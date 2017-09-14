

aws acm request-certificate

```
$ aws acm request-certificate --domain-name *.mydomain.com
{
    "CertificateArn": "arn:aws:acm:ap-northeast-1:00000000000:certificate/00000000-0000-0000-0000-5171d202badd"
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
