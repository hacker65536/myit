

```
aws autoscaling describe-tags --filters Name=Value,Values=MYVALUESVALUE Name=Key,Values=MYKEYSVALUE  --query 'Tags[*][ResourceId]' --output text
````

```console
XXXXX
XXXXX
XXXXX
```


```
aws athena list-named-queries --query '*[*].[@]' --output text
```

```
xxxxxx-xxxx-xxxx-xxxxx
xxxxxx-xxxx-xxxx-xxxxx
xxxxxx-xxxx-xxxx-xxxxx
xxxxxx-xxxx-xxxx-xxxxx
```

```
aws autoscaling describe-tags --filters Name=Key,Values=Project Name=Value,Values=someproject  --query 'Tags[*][ResourceId][*]' --output text
```



```
aws ec2 describe-instances --instance-ids i-xxxxxxx i-yyyyyyyy --query 'Reservations[*].Instances[*].Tags[?Key==`Name`].Value'
[
    [
        [
            "Nameofec21"
        ]
    ],
    [
        [
            "Nameofec22"
        ]
    ]
]
````


```
aws ec2 describe-instances --instance-ids i-xxxxxxx i-yyyyyyyy --query 'Reservations[*].Instances[].Tags[?Key==`Name`].Value'
[
    [
       "Nameofec21"
    ],
    [
       "Nameofec22"
    ]
]
```
