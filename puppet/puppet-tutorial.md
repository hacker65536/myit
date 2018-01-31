
https://puppet.com/docs/puppet/5.3/architecture.html

```
sudo rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
```

```
# cat /etc/yum.repos.d/
amzn2-core.repo  puppet5.repo
[root@ip-172-31-15-147 ~]# cat /etc/yum.repos.d/puppet5.repo
[puppet5]
name=Puppet 5 Repository el 7 - $basearch
baseurl=http://yum.puppetlabs.com/puppet5/el/7/$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet5
enabled=1
gpgcheck=1

[puppet5-source]
name=Puppet 5 Repository el 7 - Source
baseurl=http://yum.puppetlabs.com/puppet5-nightly/el/7/SRPMS
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet5
failovermethod=priority
enabled=0
gpgcheck=1
```


install server

```
yum install -y puppetserver
```

```
# yum history info 1
Loaded plugins: langpacks, priorities, update-motd
Transaction ID : 1
Begin time     : Fri Jan 26 03:50:38 2018
Begin rpmdb    : 413:a10ed8705b012cc150092e07d689fc82744639b1
End time       :            03:50:55 2018 (17 seconds)
End rpmdb      : 423:0dd1052aeac81edab3903c227fecf3c2da1440d8
User           : EC2 Default User <ec2-user>
Return-Code    : Success
Command Line   : install puppetserver
Transaction performed with:
    Installed     rpm-4.11.3-25.amzn2.0.1.x86_64 installed
    Installed     yum-3.4.3-154.amzn2.0.1.noarch installed
Packages Altered:
    Dep-Install copy-jdk-configs-2.2-3.amzn2.noarch                        @amzn2-core
    Dep-Install java-1.8.0-openjdk-headless-1:1.8.0.151-1.b12.amzn2.x86_64 @amzn2-core
    Dep-Install javapackages-tools-3.4.1-11.amzn2.noarch                   @amzn2-core
    Dep-Install libxslt-1.1.28-5.amzn2.x86_64                              @amzn2-core
    Dep-Install lksctp-tools-1.0.17-2.amzn2.x86_64                         @amzn2-core
    Dep-Install puppet-agent-5.3.3-1.el7.x86_64                            @puppet5
    Install     puppetserver-5.1.4-1.el7.noarch                            @puppet5
    Dep-Install python-javapackages-3.4.1-11.amzn2.noarch                  @amzn2-core
    Dep-Install python-lxml-3.2.1-4.amzn2.x86_64                           @amzn2-core
    Dep-Install tzdata-java-2017c-1.amzn2.noarch                           @amzn2-core
Scriptlet output:
   1 usermod: no changes
history info
```


install agent(node)
```
yum install -y puppet-agent
```

```
# yum history info
Loaded plugins: langpacks, priorities, update-motd
Transaction ID : 1
Begin time     : Fri Jan 26 03:48:26 2018
Begin rpmdb    : 413:a10ed8705b012cc150092e07d689fc82744639b1
End time       :            03:48:33 2018 (7 seconds)
End rpmdb      : 414:8d5e9b684249d5acfac4b3176e063b2627abb215
User           : EC2 Default User <ec2-user>
Return-Code    : Success
Command Line   : install puppet-agent
Transaction performed with:
    Installed     rpm-4.11.3-25.amzn2.0.1.x86_64 installed
    Installed     yum-3.4.3-154.amzn2.0.1.noarch installed
Packages Altered:
    Install puppet-agent-5.3.3-1.el7.x86_64 @puppet5
history info
```

allocate memory
`/etc/sysconfig/puppetserver`

`-Xms1g -Xmx1g`
```
###########################################
# Init settings for puppetserver
###########################################

# Location of your Java binary (version 7 or higher)
JAVA_BIN="/usr/bin/java"

# Modify this if you'd like to change the memory allocation, enable JMX, etc
JAVA_ARGS="-Xms1g -Xmx1g -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"

# These normally shouldn't need to be edited if using OS packages
USER="puppet"
GROUP="puppet"
INSTALL_DIR="/opt/puppetlabs/server/apps/puppetserver"
CONFIG="/etc/puppetlabs/puppetserver/conf.d"

# Bootstrap path
BOOTSTRAP_CONFIG="/etc/puppetlabs/puppetserver/services.d/,/opt/puppetlabs/server/apps/puppetserver/config/services.d/"

# SERVICE_STOP_RETRIES can be set here to alter the default stop timeout in
# seconds.  For systemd, the shorter of this setting or 'TimeoutStopSec' in
# the systemd.service definition will effectively be the timeout which is used.
SERVICE_STOP_RETRIES=60

# START_TIMEOUT can be set here to alter the default startup timeout in
# seconds.  For systemd, the shorter of this setting or 'TimeoutStartSec'
# in the service's systemd.service configuration file will effectively be the
# timeout which is used.
START_TIMEOUT=300


# Maximum number of seconds that can expire for a service reload attempt before
# the result of the attempt is interpreted as a failure.
RELOAD_TIMEOUT=120

```


client
```
[root@ip-172-31-15-147 ~]# puppet agent --server=ip-172-31-10-155.us-east-2.compute.internal --no-daemonize --verbose
Info: Caching certificate for ca
Info: csr_attributes file loading from /etc/puppetlabs/puppet/csr_attributes.yaml
Info: Creating a new SSL certificate request for ip-172-31-15-147.us-east-2.compute.internal
Info: Certificate Request fingerprint (SHA256): F0:EB:0A:1A:92:43:55:0F:24:8D:DE:9A:9B:7E:86:9F:BB:00:7F:82:42:21:3D:5B:78:C9:94:AF:F5:75:96:CD
Info: Caching certificate for ca
```

master
```
[root@ip-172-31-10-155 ~]# puppet cert --list --all
  "ip-172-31-15-147.us-east-2.compute.internal" (SHA256) F0:EB:0A:1A:92:43:55:0F:24:8D:DE:9A:9B:7E:86:9F:BB:00:7F:82:42:21:3D:5B:78:C9:94:AF:F5:75:96:CD
+ "ip-172-31-10-155.us-east-2.compute.internal" (SHA256) E8:0C:73:AB:6C:04:75:08:81:83:D2:CC:00:6E:CC:5A:C1:B4:E1:28:5F:CD:27:4C:4D:31:E4:A0:25:69:48:2E (alt names: "DNS:puppet", "DNS:ip-172-31-10-155.us-east-2.compute.internal")
```
