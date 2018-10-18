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
//see https://github.com/go101/go101/wiki
```
https://play.golang.org/p/ieJXgWIC0DY


compare
```go
package main

import (
	"fmt"
)

func main() {
	var a []int = nil
	fmt.Println(a)

	b := make([]int, len(a))
	copy(b, a)

	fmt.Println(b)

	if a == nil {
		fmt.Println("nil")
	} else {
		fmt.Println("not nil")
	}

	if b == nil {
		fmt.Println("nil")
	} else {
		fmt.Println("not nil")
	}
}
/*
[]
[]
nil
not nil
*/
```
https://play.golang.org/p/2K-SP3WONdj


```go
package main

import (
	"fmt"
)

func main() {
	a := []int{}
	fmt.Println(a)

	b := append([]int(nil), a...)

	fmt.Println(b)

	if a == nil {
		fmt.Println("nil")
	} else {
		fmt.Println("not nil")
	}

	if b == nil {
		fmt.Println("nil")
	} else {
		fmt.Println("not nil")
	}
}
/*
[]
[]
not nil
nil
*/
```
https://play.golang.org/p/IryIdKaVb-b

### Cut

```go
package main

import (
	"fmt"
)

func main() {

	a := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	//         0  1  2  3  4  5  6  7  8  9
	fmt.Println(a)
	// [1 2 3 4 5 6 7 8 9 10]

	fmt.Println(a[:3])
	// [1 2 3]

	fmt.Println(a[4:])
	// [5 6 7 8 9 10]

	a = append(a[:3], a[4:]...)

	fmt.Println(a)
}
/*
[1 2 3 4 5 6 7 8 9 10]
[1 2 3]
[5 6 7 8 9 10]
[1 2 3 5 6 7 8 9 10]
*/
```
https://play.golang.org/p/7WoCL7tXFNV


### Delete
```go
package main

import (
	"fmt"
)

func main() {

	a := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	//         0  1  2  3  4  5  6  7  8  9
	fmt.Println(a)
	// [1 2 3 4 5 6 7 8 9 10]

	//delete "7"

	fmt.Println(a[:6])
	// [1 2 3 4 5 6]
	fmt.Println(a[6+1:])
	// [8 9 10]

	a = append(a[:6], a[6+1:]...)

	fmt.Println(a)
}
```
https://play.golang.org/p/gfzqNB2bXAQ


```go
package main

import (
	"fmt"
)

func main() {

	a := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	//         0  1  2  3  4  5  6  7  8  9
	//fmt.Println(a)
	// [1 2 3 4 5 6 7 8 9 10]

	//delete "7"

	fmt.Println(a[:6])
	// [1 2 3 4 5 6]
	fmt.Println(a[6:])
	// [7 8 9 10]
	fmt.Println(a[6+1:])
	// [8 9 10]

	a = a[:6+copy(a[6:], a[6+1:])]

	fmt.Println(a)

	/*
		//fmt.Println(copy(a[6:], a[6+1:]))
		// 3

		copy(a[6:], a[6+1:])

		fmt.Println(a[6:])
		// [8 9 10 10]
		fmt.Println(a[:9])
		// [1 2 3 4 5 6 8 9 10]
		fmt.Println(a)
		// [1 2 3 4 5 6 8 9 10 10]
	*/
}
```
https://play.golang.org/p/CMYoz_Wv_AG

delete without preserving order
```go
package main

import (
	"fmt"
)

func main() {

	a := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	//         0  1  2  3  4  5  6  7  8  9
	//fmt.Println(a)
	// [1 2 3 4 5 6 7 8 9 10]

	//delete "7"

	fmt.Println(a[6])
	// 7
	fmt.Println(a[len(a)-1])
	// 10

	a[6] = a[len(a)-1]
	fmt.Println(a[6])
	// 10

	a = a[:len(a)-1]
	fmt.Println(a)
}
```
https://play.golang.org/p/pd3wW5rnXRi
