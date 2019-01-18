https://github.com/awslabs/aws-shell

```console
$ pip install --user aws-shell
---snip----
Installing collected packages: aws-shell
Successfully installed aws-shell-0.2.1
```

```console
$ aws-shell
Creating doc index in the background. It will be a few minutes before all documentation is available.
aws>
```



run shell command add the `!` prefix to command
```console
$ aws-shell
aws> !date
Fri Jan 18 03:14:17 UTC 2019
aws>
```

pip
```console
aws> dynamodb list-tables | jq '.'
{
  "TableNames": [
    "DemoPlayResult",
    "terraform-state-locking"
  ]
}
```


- .exit || .quit || ctrl+D
- .profile [profile] show current profile or change profile
