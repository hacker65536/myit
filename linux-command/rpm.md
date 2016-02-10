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


PACKAGE QUERY OPTIONS:  

-i,--info
- Display package information, including name,verion,and description. --queryformat if one was specified.

##sample

what package installed it?
```bash
rpm -qf /etc/rc.d/init.d/docker
docker-1.9.1-1.2.amzn1.x86_64
```
package infomation
```bash
 rpm -qi aws-cli
Name        : aws-cli
Version     : 1.10.1
Release     : 1.36.amzn1
Architecture: noarch
Install Date: Wed 10 Feb 2016 05:38:02 AM UTC
Group       : Amazon/Tools
Size        : 2948079
License     : ASL 2.0
Signature   : RSA/SHA256, Mon 08 Feb 2016 08:38:01 PM UTC, Key ID bcb4a85b21c0f39f
Source RPM  : aws-cli-1.10.1-1.36.amzn1.src.rpm
Build Date  : Fri 05 Feb 2016 09:16:04 PM UTC
Build Host  : build-64011.build
Relocations : (not relocatable)
Packager    : Amazon.com, Inc. <http://aws.amazon.com>
Vendor      : Amazon.com
URL         : http://aws.amazon.com/cli/
Summary     : Provides a unified command line interface to Amazon Web Services
Description :
This package provides a unified command line interface to Amazon Web Services.

For more information and documentation please visit http://aws.amazon.com/documentation/cli/
```
