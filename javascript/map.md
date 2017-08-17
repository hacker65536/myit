```js
var str = "123,aaa";
var arr = str.split(",");
arr = arr.map(function (val) { return val ; });
console.log(arr);

// output 
// [ '123', 'aaa' ]

```

