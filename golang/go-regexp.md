https://golang.org/pkg/strings/

https://play.golang.org/p/w5k61-XH4W9
```go
package main

import (
	"fmt"
	"strings"
)

func main() {

	s := "golang"
	r := "lang"

	fmt.Println("hello", strings.Replace(s, r, "", 1))

}
```

https://golang.org/pkg/regexp/#pkg-overview

https://play.golang.org/p/ZU_8Wh0rDsp
```go
package main

import (
	"fmt"
	"regexp"
)

func main() {
	s1 := "golang"
	s2 := "go"
	pattern := "lang"

	re := regexp.MustCompile(pattern)

	if re.MatchString(s1) {
		fmt.Println("match")
	} else {
		fmt.Println("no match")
	}

	if re.MatchString(s2) {
		fmt.Println("match")
	} else {
		fmt.Println("no match")
	}

	fmt.Println(re.ReplaceAllString(s1, s2))

}
```
