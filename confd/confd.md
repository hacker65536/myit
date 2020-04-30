# confd

https://github.com/kelseyhightower/confd





## install

```console 
$ go get github.com/kelseyhightower/confd
```

```console
$ confd --version
confd 0.17.0-dev (Git SHA: , Go Version: go1.14.2)
```

## tutorial


### set parameters to ssm parameter store

```console
$ aws ssm put-parameter --name "/myapp/database/url" --type "String" --value "db.example.com"
{
    "Version": 1,
    "Tier": "Standard"
}
```
```console 
$ aws ssm put-parameter --name "/myapp/database/user" --type "SecureString" --value "rob"
{
    "Version": 1,
    "Tier": "Standard"
}
```

### show parameters from cli

```console
$ aws ssm get-parameters-by-path --path '/myapp/database/' --output yaml
Parameters:
- ARN: arn:aws:ssm:us-east-2:000000000000:parameter/myapp/database/url
  LastModifiedDate: '2020-04-30T23:56:17.539000+09:00'
  Name: /myapp/database/url
  Type: String
  Value: db.example.com
  Version: 1
- ARN: arn:aws:ssm:us-east-2:000000000000:parameter/myapp/database/user
  LastModifiedDate: '2020-04-30T23:56:44.798000+09:00'
  Name: /myapp/database/user
  Type: SecureString
  Value: AQICAHghky8JvkO1XY+r9J9dKYfY9Lo/eJ2uwUH3/VA5I+4AmQETeHK0Yfn5EQivCMpso/4SAAAAYTBfBgkqhkiG9w0BBwagUjBQAgEAMEsGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMDIWJyLz7/B9oV5rEAgEQgB4FKLdmvYaaqFwjH2Hpje552peOCM/y/0y/FpkN45s=
  Version: 1
```


### configure dir

```
$ mkdir -p confd/{conf.d,templates}
```


### create template resource config 

`./confd/conf.d/myconfig.toml`
```toml
[template]
src = "myconfig.conf.tmpl"
dest = "/tmp/myconfig.conf"
keys = [
    "/myapp/database/url",
    "/myapp/database/user",
]
```

### create source template


```template
[myconfig]
database_url = {{getv "/myapp/database/url"}}
database_user = {{getv "/myapp/database/user"}}
```


### process template


```console
$ export AWS_SDK_LOAD_CONFIG=1
```
```console
$ confd -onetime -backend ssm -confdir ./confd
2020-05-01T00:11:02+09:00 shacker confd[58817]: INFO Backend set to ssm
2020-05-01T00:11:02+09:00 shacker confd[58817]: INFO Starting confd
2020-05-01T00:11:02+09:00 shacker confd[58817]: INFO Backend source(s) set to
```
```console
$ cat /tmp/myconfig.conf
[myconfig]
database_url = db.example.com
database_user = rob
```


### change value

```console 
$ aws ssm put-parameter --name "/myapp/database/user" --type "SecureString" --value "ned" --overwrite
{
    "Version": 2,
    "Tier": "Standard"
}
```

```console
$ confd -onetime -backend ssm -confdir ./confd
2020-05-01T00:16:24+09:00 shacker confd[69298]: INFO Backend set to ssm
2020-05-01T00:16:24+09:00 shacker confd[69298]: INFO Starting confd
2020-05-01T00:16:24+09:00 shacker confd[69298]: INFO Backend source(s) set to
2020-05-01T00:16:28+09:00 shacker confd[69298]: INFO /tmp/myconfig.conf has md5sum 8e76340b541b8ee29023c001a5e4da18 should be ee82512019bb13eb8b731a39e15a4285
2020-05-01T00:16:28+09:00 shacker confd[69298]: INFO Target config /tmp/myconfig.conf out of sync
2020-05-01T00:16:28+09:00 shacker confd[69298]: INFO Target config /tmp/myconfig.conf has been updated
```


```console
$ cat /tmp/myconfig.conf
[myconfig]
database_url = db.example.com
database_user = ned
```
