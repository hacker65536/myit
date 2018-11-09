
```go
package main

import (
        "fmt"
        "gopkg.in/yaml.v2"
        "os"
        "syscall"
        "time"
)

func main() {

        var s syscall.Stat_t
        file := "/home/ec2-user/.bashrc"

        syscall.Stat(file, &s)

        a, _ := s.Atim.Unix()
        m, _ := s.Mtim.Unix()
        c, _ := s.Ctim.Unix()

        fmt.Println("a", a)
        fmt.Println("m", m)
        fmt.Println("c", c)

        t := time.Now()
        fmt.Println("currentTime", t.Unix())
        fmt.Println("past", t.Unix()-c)

        fileinfo, _ := os.Stat(file)

        internalStat, ok := fileinfo.Sys().(*syscall.Stat_t)
        if !ok {
                fmt.Printf("Not a syscall.Stat_t")
        }

        //      fmt.Printf("stat= %#v\n", internalStat)
        o, _ := yaml.Marshal(internalStat)
        fmt.Println("--------stat---------")
        fmt.Printf("%s\n", o)

}
```
```console
$ go run sys.go
a 1538104457
m 1538104457
c 1538104457
currentTime 1541747856
past 3643399
--------stat---------
dev: 66305
ino: 13320341
nlink: 1
mode: 33188
uid: 1000
gid: 1000
x__pad0: 0
rdev: 0
size: 426
blksize: 4096
blocks: 8
atim:
  sec: 1538104457
  nsec: 443122334
mtim:
  sec: 1538104457
  nsec: 443122334
ctim:
  sec: 1538104457
  nsec: 443122334
x__unused:
- 0
- 0
- 0

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
