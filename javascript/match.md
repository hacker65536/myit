
short match
```js
var val="time:2018-03-07T11:39:21+00:00"
ret=val.match(/(.*):(.*)/);
console.log(ret)
ret=val.match(/(.*?):(.*)/);
console.log(ret)
```

```
> Array ["time:2018-03-07T11:39:21+00:00", "time:2018-03-07T11:39:21+00", "00"]
> Array ["time:2018-03-07T11:39:21+00:00", "time", "2018-03-07T11:39:21+00:00"]
```
