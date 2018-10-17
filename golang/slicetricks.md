https://github.com/golang/go/wiki/SliceTricks


### AppendVector
```go
package main

import (
	"fmt"
)

func main() {
	a := []int{0, 0}
	b := []int{1, 1}
	a = append(a, b...)
	fmt.Println(a)
}

// [0 0 1 1]
```
https://play.golang.org/p/mBzOhrDh_GE

### Copy

```go
package main

import (
	"fmt"
)

func main() {
	a := []int{0, 1, 2}
	b := make([]int, len(a))
	copy(b, a)

	fmt.Println(a)
	fmt.Println(b)
}
```
https://play.golang.org/p/tT9dQKN6Xgk
```go
package main

import (
	"fmt"
)

func main() {
	a := []int{0, 1, 2}
	b := append([]int(nil), a...)

	fmt.Println(a)
	fmt.Println(b)
}
```

https://play.golang.org/p/ECo54T5zqSq

```go
package main

import (
	"fmt"
)

func main() {
	a := []int{0, 1, 2}
	b := append(a[:0:0], a...)

	fmt.Println(a)
	fmt.Println(b)
}
```
https://play.golang.org/p/ieJXgWIC0DY
