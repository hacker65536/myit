
https://catonmat.net/ftp/bash-redirections-cheat-sheet.pdf


cmd > file
--
redirect the standard output (stdout) of cmd to a file.

```console
$ date > file
$ cat file
Fri May 24 03:27:38 UTC 2019
```

cmd 1> file
--
same as `cmd > file` `1` is the default file descriptor (fd) for stdout.

```console
$ date 1> file
$ cat file
Fri May 24 03:28:23 UTC 2019
```

cmd 2> file
--
redirect the standard error (stderr) of cmd to a file. `2` is the default fd for stderr.

```console
$ ls aaaa 2> file
$ cat file
ls: cannot access aaaa: No such file or directory
```

cmd >> file 
--
append stdout of cmd to a file.

```console
$ date >> file
$ cat file
ls: cannot access aaaa: No such file or directory
Fri May 24 03:31:46 UTC 2019
```

cmd 2>> file
--
append stderr of cmd to a file

```console
$ ls go 2>> file
bin  pkg  src
$ cat file
ls: cannot access aaaa: No such file or directory
Fri May 24 03:31:46 UTC 2019
$ ls go2 2>> file
$ cat file
ls: cannot access aaaa: No such file or directory
Fri May 24 03:31:46 UTC 2019
ls: cannot access go2: No such file or directory
```

cmd &> file
--
redirect stdout and stderr of cmd to a file.

```console
$ ls go/pkg/linux_amd64/ go/pkg/mod/ go/pkg/aaa > file
ls: cannot access go/pkg/aaa: No such file or directory
$ cat file
go/pkg/linux_amd64/:
github.com

go/pkg/mod/:
cache
github.com
golang.org
google.golang.org
```
```console
$ ls go/pkg/linux_amd64/ go/pkg/mod/ go/pkg/aaa &> file
$ cat file
ls: cannot access go/pkg/aaa: No such file or directory
go/pkg/linux_amd64/:
github.com

go/pkg/mod/:
cache
github.com
golang.org
google.golang.org
```

cmd > file 2>&1
--

Another way to redirect booth stdout and stderr of cmd to a file. This is not the sam as `cmd 2>&1 > file`. Redirection order matters!
```console
$ ls go/pkg/linux_amd64/ go/pkg/mod/ go/pkg/aaa >file 2>&1
$ cat file
ls: cannot access go/pkg/aaa: No such file or directory
go/pkg/linux_amd64/:
github.com

go/pkg/mod/:
cache
github.com
golang.org
google.golang.org
```

cmd > /dev/null
--
Discard stdout of cmd.
```console
$ ls go/pkg/linux_amd64/ > /dev/null
$ ls go/pkg/aaa >/dev/null
ls: cannot access go/pkg/aaa: No such file or directory
```


cmd 2> /dev/null
--
Discard stderr of cmd.
```console
$ ls go/pkg/aaa >/dev/null
ls: cannot access go/pkg/aaa: No such file or directory
$ ls go/pkg/aaa 2>/dev/null
$ ls go/pkg/linux_amd64/ 2>/dev/null
github.com
```

cmd &> /dev/null 
--
Discard stdout and stderr of cmd.
```console
$ ls go/pkg/linux_amd64/ &>/dev/null
$ ls go/pkg/aaa  &>/dev/null
```
cmd < file
--
Redirect the contents of the file to the standard input (stdin) of cmd.

```console
$ cat file
hello world
$ sed 's/h/w/' < file
wello world
```


cmd << EOL \nline1\nline2\nEOL
--
Redirect a bunch of lines to the stdin. If 'EOL' is quoted, text is treated literally. This is called a here-document.

```console
$ sed 's/h/w/g' <<EOL
> hello
> here
> EOL
wello
were
```



cmd <<- EOL\n<tab>foo\n<tab><tab>bar\nEOL
--
Redirect a bunch of lines to the stdin and strip the leading tabs.
  
....



cmd <<< "string"
--
Redirect a single line of text to the stdin of cmd. This is called a here-string.
```console
$ sed 's/h/w/' <<< "hello"
wello
```


exec 2> file
--

terminal no.1
```console
$ exec 2> err
Fri May 24 04:17:38 UTC 2019 # command is invisible input date
# ls aaa
```


terminal no.2
```console
$ tail -f err
$ date  # command is showing on this terminal
$ ls aaa
ls: cannot access aaa: No such file or directory
```
$ tail -f err
