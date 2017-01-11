```bash
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum install jenkins

```

```bash
sudo  yum info jenkins
Loaded plugins: priorities, update-motd, upgrade-helper
Installed Packages
Name        : jenkins
Arch        : noarch
Version     : 2.32.1
Release     : 1.1
Size        : 67 M
Repo        : installed
From repo   : jenkins
Summary     : Jenkins Continuous Integration Server
URL         : http://jenkins.io/
License     : MIT/X License, GPL/CDDL, ASL2
Description : Jenkins monitors executions of repeated jobs, such as building a software
            : project or jobs run by cron. Among those things, current Jenkins focuses on the
            : following two jobs:
            : - Building/testing software projects continuously, just like CruiseControl or
            :   DamageControl. In a nutshell, Jenkins provides an easy-to-use so-called
            :   continuous integration system, making it easier for developers to integrate
            :   changes to the project, and making it easier for users to obtain a fresh
            :   build. The automated, continuous build increases the productivity.
            : - Monitoring executions of externally-run jobs, such as cron jobs and procmail
            :   jobs, even those that are run on a remote machine. For example, with cron,
            :   all you receive is regular e-mails that capture the output, and it is up to
            :   you to look at them diligently and notice when it broke. Jenkins keeps those
            :   outputs and makes it easy for you to notice when something is wrong.
            :
            : Authors:
            : --------
            :     Kohsuke Kawaguchi <kk@kohsuke.org>

```

ssl
```
sudo yum -y install nginx
sudo mkdir /etc/nginx/ssl
cd /etc/nginx/ssl/
sudo openssl req \
> -batch \
> -nodes \
> -x509 \
> -newkey rsa:2048 \
> -days 3652 \
> -subj "/C=JP/ST=Tokyo/L=Shibuya/O=mycompany/OU=infra/CN=mycompany.com" \
> -keyout example.key \
> -out example.crt
```

/etc/nginx/conf.d/virtual.conf
```

# A virtual host using mix of IP-, name-, and port-based configuration
#

#server {
#    listen       8000;
#    listen       somename:8080;
#    server_name  somename  alias  another.alias;

#    location / {
#        root   html;
#        index  index.html index.htm;
#    }
#}

server {
    listen       443;
#    listen       somename:8080;
    server_name  somename  alias  another.alias;

        ssl on;
        ssl_certificate /etc/nginx/ssl/example.crt;
        ssl_certificate_key /etc/nginx/ssl/example.key;
        location / {
         proxy_pass http://localhost:8080;

        }
}
```

```
sudo chkconfig nginx on
sudo chkconfig jenkins on
sudo service nginx start
sudo service jenkins start
```





