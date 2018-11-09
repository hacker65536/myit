
```go
package main

import (
        "fmt"
        "syscall"
        "time"
)

func main() {
        var s syscall.Stat_t
        syscall.Stat("/home/ec2-user/.bashrc", &s)
        sec_a, _ := s.Atim.Unix()
        sec_m, _ := s.Mtim.Unix()
        sec_c, _ := s.Ctim.Unix()

        fmt.Println("sec_a", sec_a)
        fmt.Println("sec_m", sec_m)
        fmt.Println("sec_c", sec_c)

        t := time.Now()
        fmt.Println(t.Unix())
        fmt.Println(t.Unix() - sec_c)
}
```
```console
$ go run sys.go
sec_a 1538104457
sec_m 1538104457
sec_c 1538104457
1541746395
3641938
```
```console
$ stat /home/ec2-user/.bashrc
  File: ‘/home/ec2-user/.bashrc’
  Size: 426             Blocks: 8          IO Block: 4096   regular file
Device: 10301h/66305d   Inode: 13320341    Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/ec2-user)   Gid: ( 1000/ec2-user)
Access: 2018-09-28 03:14:17.443122334 +0000
Modify: 2018-09-28 03:14:17.443122334 +0000
Change: 2018-09-28 03:14:17.443122334 +0000
 Birth: -
```
