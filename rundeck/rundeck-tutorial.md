
https://dev.classmethod.jp/server-side/server/try-rundeck-job/


1. login
2. create project
3. create job
4. add nodes to resource.xml
5. add user and set autohrized_keys (nodes)
6. select dispatch to nodes at job's configuration

```xml
<?xml version="1.0" encoding="UTF-8"?>

<project>
  <node name="localhost" description="Rundeck server node" tags="" hostname="localhost" osArch="amd64" osFamily="unix" osName="Linux" osVersion="4.9.76-38.79.amzn2.x86_64" username="rundeck"/>
  <node name="remote" description="Rundeck server node" tags="" hostname="172.31.1.1" osArch="amd64" osFamily="unix" osName="Linux" osVersion="4.9.76-38.79.amzn2.x86_64" username="rundeck"/>
</project>
```
