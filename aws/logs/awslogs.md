
http://dev.classmethod.jp/cloud/aws/show-cloudwatch-logs-with-awslogs-command/

```
pip install --user awslogs
```


show list of groups
```
awslogs groups --profile myprf --region us-west-2
```

show list of streams
```
awslogs streams /var/log/nginx/access_log --profile myprf --region us-west-2
``` 

get log
```
awslogs get  /var/log/nginx/access_log --profile myprf --region us-west-2
``` 
