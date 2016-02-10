#rpm
RPM Package Manager
##option

-f,--file 
- Query package owning FILE.


The general form of an rpm query command is

__rpm {-q|--query} [select-options] [query-options]__



what package installed it?
```bash
rpm -qf /etc/rc.d/init.d/docker
docker-1.9.1-1.2.amzn1.x86_64
```
