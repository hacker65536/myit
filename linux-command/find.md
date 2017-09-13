


* -exec command ; 
* -exec command {} + 


* -type c file is of type c
* -type f regular file
* -type l symbolic link
* -type d directory
* -type b block(buffered) special
* -type s socket)
* -type p pipe(FIFO)


* -uid n userID is n

* -userd n file was last accessed n days after its status was last changed

* - user uname file is owned by user uname (numeric user ID allowed)

* -size n[cwbkMG] file uses n units of space. the following suffixes can be used
* -size b for 512-byte blocks
* -size c for bytes
* -szie w for two-byte words
* -size k for kilobytes (units of 1024 bytes)
* -size M for Megabytes
* -size G for Gigabytes


* -regex pattern

* -perm mode
* -perm /mode
* -perm +mode

* -path parttern

* -mmin n file's data was last modified n minutes ago
* -mtime n file's data was last modified n*24 hours(day) ago
* -atime n file was last accessed n*24 hours(day) ago
* -cmin n files's status was last changed n minutes ago.
* -ctime n file's status was last chnaged n*24 hours ago


* -empty file is empty and is either a regular file or a directory

* -anewer file file was last accessed more recently than file was modified
* -cnewer file file's status was last changed more recently than file was modified 
