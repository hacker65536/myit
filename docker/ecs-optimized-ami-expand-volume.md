```
  $ sudo growpart /dev/xvdcz 1
  $ sudo pvresize /dev/sdcz1
  $ sudo lvextend -l +100%FREE /dev/docker/docker-pool 
  ```
