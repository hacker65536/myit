

```
❯ go install
# golang.org/x/sys/unix
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/syscall_darwin.1_13.go:29:3: //go:linkname must refer to declared function or variable
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/zsyscall_darwin_arm64.1_13.go:27:3: //go:linkname must refer to declared function or variable
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/zsyscall_darwin_arm64.1_13.go:40:3: //go:linkname must refer to declared function or variable
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/zsyscall_darwin_arm64.go:28:3: //go:linkname must refer to declared function or variable
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/zsyscall_darwin_arm64.go:43:3: //go:linkname must refer to declared function or variable
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/zsyscall_darwin_arm64.go:59:3: //go:linkname must refer to declared function or variable
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/zsyscall_darwin_arm64.go:75:3: //go:linkname must refer to declared function or variable
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/zsyscall_darwin_arm64.go:90:3: //go:linkname must refer to declared function or variable
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/zsyscall_darwin_arm64.go:105:3: //go:linkname must refer to declared function or variable
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/zsyscall_darwin_arm64.go:121:3: //go:linkname must refer to declared function or variable
../go/pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/unix/zsyscall_darwin_arm64.go:121:3: too many errors
```

https://stackoverflow.com/questions/71507321/go-1-18-build-error-on-mac-unix-syscall-darwin-1-13-go253-golinkname-mus



```
cd project
go get -u golang.org/x/sys
go install
```
