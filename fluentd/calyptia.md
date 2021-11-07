config visualizer

```
<source>
  @type http
  port 8888
  bind 0.0.0.0
</source>

<filter test.cycle>
  @type grep
  <exclude>
    key action
    pattern ^logout$
  </exclude>
</filter>

<match test.cycle>
  @type stdout
</match>
```

![image](https://user-images.githubusercontent.com/2577368/140632605-818684e6-501c-4a15-ba6c-a989fe7afa73.png)
https://link.calyptia.com/u8h

