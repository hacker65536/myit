https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/white-label-name-servers.html

https://docs.aws.amazon.com/ja_jp/Route53/latest/APIReference/API_CreateReusableDelegationSet.html

https://docs.aws.amazon.com/cli/latest/reference/route53/create-reusable-delegation-set.html

```
$ cr=$(pwgen -a1)
$ aws route53 create-reusable-delegation-set --caller-reference $cr
{
    "Location": "https://route53.amazonaws.com/2013-04-01/delegationset/yyyyyyyyyy",
    "DelegationSet": {
        "NameServers": [
            "ns-1334.awsdns-38.org",
            "ns-977.awsdns-58.net",
            "ns-1897.awsdns-45.co.uk",
            "ns-171.awsdns-21.com"
        ],
        "CallerReference": "aekiew2K",
        "Id": "/delegationset/yyyyyyyyyy"
    }
}
```

```
$ cr1=$(pwgen -1a)
$ aws route53 create-hosted-zone \
--name aws-test1.com. \
--caller-reference $cr1 \
--delegation-set-id /delegationset/yyyyyyyyyy
{
    "HostedZone": {
        "ResourceRecordSetCount": 2,
        "CallerReference": "thu0OhRu",
        "Config": {
            "PrivateZone": false
        },
        "Id": "/hostedzone/xxxxxxxxxx",
        "Name": "aws-test1.com."
    },
    "DelegationSet": {
        "NameServers": [
            "ns-1334.awsdns-38.org",
            "ns-977.awsdns-58.net",
            "ns-1897.awsdns-45.co.uk",
            "ns-171.awsdns-21.com"
        ],
        "CallerReference": "aekiew2K",
        "Id": "/delegationset/yyyyyyyyyy"
    },
    "Location": "https://route53.amazonaws.com/2013-04-01/hostedzone/xxxxxxxxxx",
    "ChangeInfo": {
        "Status": "PENDING",
        "SubmittedAt": "2018-02-07T03:33:12.316Z",
        "Id": "/change/zzzzzzzzz"
    }
}
```


delete hosted zone
```
$ aws route53 delete-hosted-zone --id xxxxxxxx
{
    "ChangeInfo": {
        "Status": "PENDING",
        "SubmittedAt": "2018-02-07T03:42:05.466Z",
        "Id": "/change/xxxxxxxxxxxx"
    }
}
```

delete reusable delegation set
```
$ aws route53 delete-reusable-delegation-set --id yyyyyyyyyy
```
