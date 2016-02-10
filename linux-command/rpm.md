#rpm
RPM Package Manager
##option




The general form of an rpm query command is

__rpm {-q|--query} [select-options] [query-options]__

PACKAGE SELECTION OPTIONS:  
-a,--all
- query all installed packages.  
-f,--file FILE  
- query package owning FILE.

what package installed it?
```bash
rpm -qf /etc/rc.d/init.d/docker
docker-1.9.1-1.2.amzn1.x86_64
```
