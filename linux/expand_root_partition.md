
modified volume



amzlinux
--------------


```
sudo LANG=C growpart /dev/xvda 1
sudo resize2fs /dev/xvda1
```



centos7(xfs)
--------------------

```
sudo LANG=C growpart /dev/xvda 1
sudo xfs_growfs /dev/xvda1
```
