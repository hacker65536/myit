
# generate key

generate key from gpg

[gpg](../gpg/gpg.md)


```
$ gpg --export username | base64 | tr -d '\n' > gpg_key
```

# terraform template

```hcl
provider "aws" {
  region  = "us-west-2"
}

data "aws_iam_policy_document" "iam" {
  statement {
    sid = "1"

    actions = [
      "sns:Publish",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_user" "iam" {
  name = "${terraform.env}-user"
}

resource "aws_iam_user_policy" "iam" {
  name   = "${aws_iam_user.iam.name}-policy"
  user   = "${aws_iam_user.iam.name}"
  policy = "${data.aws_iam_policy_document.iam.json}"
}

resource "aws_iam_access_key" "iam" {
  user    = "${aws_iam_user.iam.name}"
  pgp_key = "${file("gpg_key")}"
}

output "iam_secret" {
  value = "${aws_iam_access_key.iam.encrypted_secret}"
}

output "iam_id" {
  value = "${aws_iam_access_key.iam.id}"
}

```


```
terraform output iam_secret | base64 -d | gpg -d
```
