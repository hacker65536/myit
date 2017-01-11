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
