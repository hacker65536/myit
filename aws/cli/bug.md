

```console
$ aws ssm put-parameter --name /amibld/slack_webhookurl --value "https://hooks.slack.com/services/xxxx/xxxxx/liWRdlDE7GNpxdxl9nGUZDcD" --type SecureString --debug
```

```
2019-05-24 04:43:17,792 - MainThread - urllib3.connectionpool - DEBUG - https://hooks.slack.com:443 "GET /services/xxxx/xxxxx/liWRdlDE7GNpxdxl9nGUZDcD HTTP/1.1" 400 None
2019-05-24 04:43:17,793 - MainThread - awscli.clidriver - DEBUG - Exception caught in main()
```



https://github.com/aws/aws-cli/pull/3384
