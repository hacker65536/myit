#Wget
The non-interactive network downloader.

##option

- --trust-server-names  
  If this is set to on, on a redirect the last component of the redirection URL will be used as the local file name.  By default it is used the last component in the original URL.
- -nc,--no-clobber  
  If a file is downloaded more than once in the same directory, Wget's behavior depends on a few options, including -nc.  In certain cases, the local file will be clobbered, or overwritten, upon repeated download.  In other cases it will be preserved.
