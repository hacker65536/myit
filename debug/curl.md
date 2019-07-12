# debug route53 , cloudfront , alb(elb) from curl with ssl(sni) 

https://dev.classmethod.jp/server-side/use-resolv-option-to-verify-sni/

```console
$ curl -v https://myhost.mydomain.com/ --resolv albtest-elb-000000000.us-east-1.elb.amazonaws.com:443:123.123.123.123
```
