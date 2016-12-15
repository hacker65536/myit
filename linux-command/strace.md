#strace
trace system calls and signals


```bash
strace echo "aaa"
execve("/bin/echo", ["echo", "aaa"], [/* 35 vars */]) = 0
brk(0)                                  = 0x21d8000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fac3ddaa000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=20332, ...}) = 0
mmap(NULL, 20332, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fac3dda5000
close(3)                                = 0
open("/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 \34\2\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=2112368, ...}) = 0
mmap(NULL, 3936832, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fac3d7c8000
mprotect(0x7fac3d97f000, 2097152, PROT_NONE) = 0
mmap(0x7fac3db7f000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1b7000) = 0x7fac3db7f000
mmap(0x7fac3db85000, 16960, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fac3db85000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fac3dda4000
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fac3dda2000
arch_prctl(ARCH_SET_FS, 0x7fac3dda2740) = 0
mprotect(0x7fac3db7f000, 16384, PROT_READ) = 0
mprotect(0x7fac3ddab000, 4096, PROT_READ) = 0
munmap(0x7fac3dda5000, 20332)           = 0
brk(0)                                  = 0x21d8000
brk(0x21f9000)                          = 0x21f9000
brk(0)                                  = 0x21f9000
open("/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=106065056, ...}) = 0
mmap(NULL, 106065056, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fac372a1000
close(3)                                = 0
fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 0), ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fac3dda9000
write(1, "aaa\n", 4aaa
)                    = 4
close(1)                                = 0
munmap(0x7fac3dda9000, 4096)            = 0
close(2)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
```
