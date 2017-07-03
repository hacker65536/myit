
# gpg
```
]$ gpg --gen-key
gpg (GnuPG) 2.0.28; Copyright (C) 2015 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
Your selection?
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048)
Requested keysize is 2048 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0)
Key does not expire at all
Is this correct? (y/N) y

GnuPG needs to construct a user ID to identify your key.

Real name: test_user
Email address:
Comment:
You selected this USER-ID:
    "test_user"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit?
```

```

                  lqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk
                  x Enter passphrase                                    x
                  x                                                     x
                  x                                                     x
                  x Passphrase ________________________________________ x
                  x                                                     x
                  x       <OK>                             <Cancel>     x
                  mqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj


```




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
