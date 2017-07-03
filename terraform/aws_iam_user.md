

generate key from gpg

[gpg](../gpg/gpg.md)

```hcl
resource "aws_iam_user" "iam" {
  name = "${terraform.env}-user"
}

resource "aws_iam_user_policy" "iam" {
  name   = "${aws_iam_user.iam.name}-policy"
  user   = "${aws_iam_user.iam.name}"
  policy = "${data.aws_iam_policy_document.user.json}"
}

resource "aws_iam_access_key" "iam" {
  user    = "${aws_iam_user.iam.name}"
  pgp_key = ""

}

output "iam_secret" {
  value = "${aws_iam_access_key.github.encrypted_secret}"
}

output "iam_id" {
  value = "${aws_iam_access_key.github.id}"
}
```
