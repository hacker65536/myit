
-tempfileがないと複数指定した場合データが飛ぶ

```
[plugin.metrics.aurora56]
 command = "mackerel-plugin-mysql -username=foo -password=passowrd -enable_extended=true -host=aurora56.cluster-xxxxxx.us-west-2.rds.amazonaws.com -tempfile /tmp/mackerel-aurora56"
 custom_identifier = "aurora56.cluster-xxxxxx.us-west-2.rds.amazonaws.com"
```
