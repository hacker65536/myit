https://rundeck.github.io/rundeck-cli/install/

```
yum install -y http://repo.rundeck.org/latest.rpm
yum install -y rundeck-cli
```

```
export RD_URL=http://localhost.4440
```

using api token
-----------

generate new token from user profile page

```
export RD_TOKEN=TOKEN
```


```
rd jobs list -p project_name
```
