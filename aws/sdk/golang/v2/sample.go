package main

import (
        "fmt"
        //      "os"
        //      "strings"

        //"github.com/aws/aws-sdk-go-v2/aws"
        "github.com/aws/aws-sdk-go-v2/aws/external"
        "github.com/aws/aws-sdk-go-v2/service/ec2"
)

func main() {
        cfg, err := external.LoadDefaultAWSConfig()
        if err != nil {
                //exitErrorf("failed to load config, %v", err)
                fmt.Println(err)
        }

        //      awsRegion := "us-west-2"

        //      cfg.Region = awsRegion
        svc := ec2.New(cfg)

        params := &ec2.DescribeVpcsInput{}

        req := svc.DescribeVpcsRequest(params)
        resp, err := req.Send()

        if err != nil {
                fmt.Println(err)
        }
        fmt.Printf("%+v\n", *resp)

}
