# debug route53 , cloudfront , alb(elb) from curl with ssl(sni) 

https://dev.classmethod.jp/server-side/use-resolv-option-to-verify-sni/

```console
$ curl -v https://myhost.mydomain.com/ --resolv albtest-elb-000000000.us-east-1.elb.amazonaws.com:443:123.123.123.123
```


cloudfront 

```
$ curl -v https://fadfadfdfad.cloudfront.net/  --resolv fadfadfdfad.cloudfront.net:443:CLOUDFRONTIP -H "host: myhost.com"
```
