https://help.github.com/enterprise/2.10/admin/guides/installation/installing-github-enterprise-on-aws/


```
$ aws ec2 describe-images --owners 895557238572 --query 'sort_by(Images,&Name)[*].{Name:Name,ImageID:ImageId}' --output=text --region us-east-2
ami-40103625	GitHub Enterprise 2.10.0
ami-89af89ec	GitHub Enterprise 2.10.1
ami-e89eb88d	GitHub Enterprise 2.10.2
ami-f3d9f896	GitHub Enterprise 2.10.3
ami-fa18389f	GitHub Enterprise 2.10.4
ami-ba4b11df	GitHub Enterprise 2.8.0
ami-1b4f157e	GitHub Enterprise 2.8.1
ami-39e5c15c	GitHub Enterprise 2.8.10
ami-be6d4adb	GitHub Enterprise 2.8.11
ami-ed0c2b88	GitHub Enterprise 2.8.12
ami-16a08773	GitHub Enterprise 2.8.13
ami-8d2c0ae8	GitHub Enterprise 2.8.14
ami-a99cbacc	GitHub Enterprise 2.8.15
ami-8fd8f9ea	GitHub Enterprise 2.8.16
ami-2e19394b	GitHub Enterprise 2.8.17
ami-7899c31d	GitHub Enterprise 2.8.2
ami-bc97cdd9	GitHub Enterprise 2.8.3
ami-6ec3990b	GitHub Enterprise 2.8.4
ami-a2edb7c7	GitHub Enterprise 2.8.5
ami-a07055c5	GitHub Enterprise 2.8.6
ami-f3381d96	GitHub Enterprise 2.8.7
ami-0383a666	GitHub Enterprise 2.8.8
ami-8c5672e9	GitHub Enterprise 2.8.9
ami-d081a4b5	GitHub Enterprise 2.9.0
ami-da4b6fbf	GitHub Enterprise 2.9.1
ami-d3e7c3b6	GitHub Enterprise 2.9.2
ami-a96146cc	GitHub Enterprise 2.9.3
ami-b80126dd	GitHub Enterprise 2.9.4
ami-15a08770	GitHub Enterprise 2.9.5
ami-222a0c47	GitHub Enterprise 2.9.6
ami-e99eb88c	GitHub Enterprise 2.9.7
ami-28d8f94d	GitHub Enterprise 2.9.8
ami-ad1939c8	GitHub Enterprise 2.9.9
```
