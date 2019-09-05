# show current accuont info

```console
$ aws sts get-caller-identity
{
    "Account": "000000000000",
    "UserId": "ABCDEFGHIJKLMNOPQRSTU:mysessionname",
    "Arn": "arn:aws:sts::000000000000:assumed-role/ROLENAME/mysessionname"
}
