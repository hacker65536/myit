
string(RFC3339) to unix
--
```golang
t,_ := time.Parse(time.RFC3339, "2019-04-23T01:24:25Z")
fmt.Println(t.Unix())
```
