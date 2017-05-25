
```hcl
# vim:set foldmethod=marker:

/* {{{ */

resource "aws_codepipeline" "cpl" {
  name     = "${terraform.env}-cpl"
  role_arn = "${aws_iam_role.cpl.arn}"
}


/* }}} */
```

```vim
:%foldclose
```
