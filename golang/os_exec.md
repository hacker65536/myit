
```go
import(
"os/exec"
)

func execRun(name string, args ...string) {

        out, err := exec.Command(name, args...).Output()
        chk(err)
        if len(out) != 0 {
                fmt.Printf("%s", out)
        }

}
```
