
create trust relationship
```console
$ cat <<'EOF' > trust_relationship.json
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
EOF
```

```console
$ aws iam create-role --role-name roletest \
   --assume-role-policy-document file://trust_relationship.json
```

```console
$ aws iam create-instance-profile --instance-profile-name roletest1
```
```console
$ aws iam create-instance-profile --instance-profile-name roletest2
```

```console 
$ aws iam add-role-to-instance-profile --instance-profile-name roletest1 --role-name roletest
```

```console
$ aws iam add-role-to-instance-profile --instance-profile-name roletest2 --role-name roletest
```
