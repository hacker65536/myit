
```
$ memcached -h
memcached 1.4.15
-p <num>      TCP port number to listen on (default: 11211)
-U <num>      UDP port number to listen on (default: 11211, 0 is off)
-s <file>     UNIX socket path to listen on (disables network support)
-a <mask>     access mask for UNIX socket, in octal (default: 0700)
-l <addr>     interface to listen on (default: INADDR_ANY, all addresses)
              <addr> may be specified as host:port. If you don't specify
              a port number, the value you specified with -p or -U is
              used. You may specify multiple addresses separated by comma
              or by using -l multiple times
-d            run as a daemon
-r            maximize core file limit
-u <username> assume identity of <username> (only when run as root)
-m <num>      max memory to use for items in megabytes (default: 64 MB)
-M            return error on memory exhausted (rather than removing items)
-c <num>      max simultaneous connections (default: 1024)
-k            lock down all paged memory.  Note that there is a
              limit on how much memory you may lock.  Trying to
              allocate more than that would fail, so be sure you
              set the limit correctly for the user you started
              the daemon with (not for -u <username> user;
              under sh this is done with 'ulimit -S -l NUM_KB').
-v            verbose (print errors/warnings while in event loop)
-vv           very verbose (also print client commands/reponses)
-vvv          extremely verbose (also print internal state transitions)
-h            print this help and exit
-i            print memcached and libevent license
-P <file>     save PID in <file>, only used with -d option
-f <factor>   chunk size growth factor (default: 1.25)
-n <bytes>    minimum space allocated for key+value+flags (default: 48)
-L            Try to use large memory pages (if available). Increasing
              the memory page size could reduce the number of TLB misses
              and improve the performance. In order to get large pages
              from the OS, memcached will allocate the total item-cache
              in one large chunk.
-D <char>     Use <char> as the delimiter between key prefixes and IDs.
              This is used for per-prefix stats reporting. The default is
              ":" (colon). If this option is specified, stats collection
              is turned on automatically; if not, then it may be turned on
              by sending the "stats detail on" command to the server.
-t <num>      number of threads to use (default: 4)
-R            Maximum number of requests per event, limits the number of
              requests process for a given connection to prevent
              starvation (default: 20)
-C            Disable use of CAS
-b <num>      Set the backlog queue limit (default: 1024)
-B            Binding protocol - one of ascii, binary, or auto (default)
-I            Override the size of each slab page. Adjusts max item size
              (default: 1mb, min: 1k, max: 128m)
-S            Turn on Sasl authentication
-o            Comma separated list of extended or experimental options
              - (EXPERIMENTAL) maxconns_fast: immediately close new
                connections if over maxconns limit
              - hashpower: An integer multiplier for how large the hash
                table should be. Can be grown at runtime if not big enough.
                Set this based on "STAT hash_power_level" before a
                restart.
```
