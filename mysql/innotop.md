https://github.com/innotop/innotop

https://yoku0825.blogspot.com/2012/05/innotop.html

require
```console
$ sudo yum install perl-ExtUtils-MakeMaker
$ sudo yum install perl-DBI
$ sudo yum install perl-DBD-MySQ
```

```console
$ git clone https://github.com/innotop/innotop.git
$ cd !$:t:r
$ perl Makefile.PL
$ make
$ sudo make install
```

```console
$ innotop --help
Usage: innotop <options> <innodb-status-file>

  --askpass          Prompt for a password when connecting to MySQL
  --[no]color   -C   Use terminal coloring (default)
  --config      -c   Config file to read
  --count            Number of updates before exiting
  --delay       -d   Delay between updates in seconds
  --help             Show this help message
  --host        -h   Connect to host
  --[no]inc     -i   Measure incremental differences
  --mode        -m   Operating mode to start in
  --nonint      -n   Non-interactive, output tab-separated fields
  --password    -p   Password to use for connection
  --port        -P   Port number to use for connection
  --skipcentral -s   Skip reading the central configuration file
  --socket      -S   MySQL socket to use for connection
  --spark            Length of status sparkline (default 10)
  --timestamp   -t   Print timestamp in -n mode (1: per iter; 2: per line)
  --user        -u   User for login if not current user
  --version          Output version information and exit
  --write       -w   Write running configuration into home directory if no config files were loaded

innotop is a MySQL and InnoDB transaction/status monitor, like 'top' for
MySQL.  It displays queries, InnoDB transactions, lock waits, deadlocks,
foreign key errors, open tables, replication status, buffer information,
row operations, logs, I/O operations, load graph, and more.  You can
monitor many servers at once with innotop.
```
