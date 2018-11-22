```go
package main

import (
        "fmt"
        "os/exec"
)

func main() {
        out, _ := exec.Command("sh", "-c", "ls -la | wc -l").Output()
        fmt.Println(string(out))
}
```
