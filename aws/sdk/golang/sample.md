`~/.aws/config`
```ini
[profile default]
role_arn = arn:aws:iam::ACCOUNTID:role/ROLENAME
source_profile = myprofile
region = us-east-2

[profile myprofile]
region = us-west-2


[profile myprofile2]
role_arn = arn:aws:iam::ACCOUNTID:role/ROLENAME
source_profile = myprofile
region = us-west-2
```

`~/.aws/credentials`
```ini
[myprofile]
aws_access_key_id = AAAAAAAAAAAAAAAAAAAAAAAAAAAA
aws_secret_access_key = AAAAAAAAAAAAAAAAAAAAAAAAAAAA
```



```golang
package main

import (
        "fmt"
        "github.com/aws/aws-sdk-go/aws"
        "github.com/aws/aws-sdk-go/aws/awserr"
        "github.com/aws/aws-sdk-go/aws/credentials/stscreds"
        "github.com/aws/aws-sdk-go/aws/session"
        "github.com/aws/aws-sdk-go/service/ec2"
)

func main() {

        sess := session.Must(session.NewSessionWithOptions(
                session.Options{
                        Config:  aws.Config{Region: aws.String("us-east-2")},
                        Profile: "MYPROFILE",
                }))
        creds := stscreds.NewCredentials(sess, "arn:aws:iam::ACCOUNTID:role/ROLENAME")

        svc := ec2.New(sess, &aws.Config{Credentials: creds})
        input := &ec2.DescribeVpcsInput{
        //      VpcIds: []*string{
        //              aws.String("vpc-a01106c2"),
        //},
        }

        result, err := svc.DescribeVpcs(input)
        if err != nil {
                if aerr, ok := err.(awserr.Error); ok {
                        switch aerr.Code() {
                        default:
                                fmt.Println(aerr.Error())
                        }
                } else {
                        // Print the error, cast err to awserr.Error to get the Code and
                        // Message from an error.
                        fmt.Println(err.Error())
                }
                return
        }

        fmt.Println(result)
}
```
