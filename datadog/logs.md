
```console
mkdir /etc/datadog/conf.d/<myapp>.d/
touch /etc/datadog/conf.d/<myapp>.d/conf.yaml
```


```yaml
init_config:

instances:

logs:
  - type: file
    path: /var/log/myapp.log
    service: myapp
    source: myapp
```

```console
systemctl restart datadog-agent
```

```console
/usr/bin/datadog-agent configcheck
```
```
=== myapp check ===
Configuration provider: file
Configuration source: file:/etc/datadog-agent/conf.d/myapp.d/conf.yaml
Log Config:
logs:
- path: /var/log/myapp.log
  service: myapp
  source: myapp
  type: file
===
```
