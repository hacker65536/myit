https://godoc.org/sort#Slice


```golang
package main

import (
	"fmt"
	"sort"
)

func main() {
	people := []struct {
		Name string
		Age  int
	}{
		{"Gopher", 7},
		{"Alice", 55},
		{"Vera", 24},
		{"Bob", 75},
	}
	
	fmt.Println(people[1].Name)
	sort.Slice(people, func(i, j int) bool { return people[i].Name < people[j].Name })
	fmt.Println("By name:", people)

	sort.Slice(people, func(i, j int) bool { return people[i].Age < people[j].Age })
	fmt.Println("By age:", people)
}
```

```
Alice
By name: [{Alice 55} {Bob 75} {Gopher 7} {Vera 24}]
By age: [{Gopher 7} {Vera 24} {Alice 55} {Bob 75}]
```
