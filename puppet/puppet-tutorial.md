
https://puppet.com/docs/puppet/5.3/architecture.html


agent/master architecture


master 172.31.3.96  
agent  172.31.9.22





install repository / master and agent 
```
rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
```

```
# cat /etc/yum.repos.d/puppet5.repo
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


install server / master 

```
yum install -y puppetserver
```

```
# yum history info 1
Loaded plugins: langpacks, priorities, update-motd
Transaction ID : 1
Begin time     : Wed Jan 31 11:22:37 2018
Begin rpmdb    : 413:a10ed8705b012cc150092e07d689fc82744639b1
End time       :            11:22:54 2018 (17 seconds)
End rpmdb      : 423:0dd1052aeac81edab3903c227fecf3c2da1440d8
User           : EC2 Default User <ec2-user>
Return-Code    : Success
Command Line   : install -y puppetserver
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


install agent / agent 
```
yum install -y puppet-agent
```

```
# yum history info
Loaded plugins: langpacks, priorities, update-motd
Transaction ID : 1
Begin time     : Wed Jan 31 11:23:59 2018
Begin rpmdb    : 413:a10ed8705b012cc150092e07d689fc82744639b1
End time       :            11:24:05 2018 (6 seconds)
End rpmdb      : 414:8d5e9b684249d5acfac4b3176e063b2627abb215
User           : EC2 Default User <ec2-user>
Return-Code    : Success
Command Line   : install -y puppet-agent
Transaction performed with:
    Installed     rpm-4.11.3-25.amzn2.0.1.x86_64 installed
    Installed     yum-3.4.3-154.amzn2.0.1.noarch installed
Packages Altered:
    Install puppet-agent-5.3.3-1.el7.x86_64 @puppet5
history info
```

allocate memory / master 

to change size of memory ,if using small size instance 

```
# diff <(cat /etc/sysconfig/puppetserver) <(sed 's/Xms2g -Xmx2g/Xms1g -Xmx1g/' /etc/sysconfig/puppetserver)
9c9
< JAVA_ARGS="-Xms2g -Xmx2g -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"
---
> JAVA_ARGS="-Xms1g -Xmx1g -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"
```

```
sed -e 's/Xms2g -Xmx2g/Xms1g -Xmx1g/' -i /etc/sysconfig/puppetserver
```

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

start service / master
```
systemctl start puppetserver
```
```
# journalctl -u puppetserver
-- Logs begin at Wed 2018-01-31 11:16:28 UTC, end at Wed 2018-01-31 11:35:15 UTC. --
Jan 31 11:34:07 ip-172-31-3-96.us-east-2.compute.internal systemd[1]: Starting puppetserver Service.
Jan 31 11:35:08 ip-172-31-3-96.us-east-2.compute.internal systemd[1]: Started puppetserver Service.
```

cert list / master  

https://puppet.com/docs/puppetserver/5.1/services_master_puppetserver.html#certificate-authority-service

```
# puppet cert list --all
+ "ip-172-31-3-96.us-east-2.compute.internal" (SHA256) 17:89:50:8F:D2:2C:E1:DA:63:5A:54:7A:0B:86:D0:08:99:96:67:F4:B6:BB:21:F7:4A:45:58:FA:A5:80:35:72 (alt names: "DNS:puppet", "DNS:ip-172-31-3-96.us-east-2.compute.internal")
```

agent test / agent
```
# puppet agent --test --server ip-172-31-3-96.us-east-2.compute.internal
Info: Caching certificate for ca
Info: csr_attributes file loading from /etc/puppetlabs/puppet/csr_attributes.yaml
Info: Creating a new SSL certificate request for ip-172-31-9-22.us-east-2.compute.internal
Info: Certificate Request fingerprint (SHA256): 68:A2:0C:12:91:72:50:C0:38:85:7F:F0:3D:B5:E9:6C:35:E1:08:15:F5:80:45:AC:8F:A4:49:86:09:48:FC:BE
Info: Caching certificate for ca
Exiting; no certificate found and waitforcert is disabled
```

show request / master
```
# puppet cert list
  "ip-172-31-9-22.us-east-2.compute.internal" (SHA256) 68:A2:0C:12:91:72:50:C0:38:85:7F:F0:3D:B5:E9:6C:35:E1:08:15:F5:80:45:AC:8F:A4:49:86:09:48:FC:BE
```

sign cert / master
```
# puppet cert sign ip-172-31-9-22.us-east-2.compute.internal
Signing Certificate Request for:
  "ip-172-31-9-22.us-east-2.compute.internal" (SHA256) 68:A2:0C:12:91:72:50:C0:38:85:7F:F0:3D:B5:E9:6C:35:E1:08:15:F5:80:45:AC:8F:A4:49:86:09:48:FC:BE
Notice: Signed certificate request for ip-172-31-9-22.us-east-2.compute.internal
Notice: Removing file Puppet::SSL::CertificateRequest ip-172-31-9-22.us-east-2.compute.internal at '/etc/puppetlabs/puppet/ssl/ca/requests/ip-172-31-9-22.us-east-2.compute.internal.pem'
```

show cert list / master
```
# puppet cert list --all
+ "ip-172-31-3-96.us-east-2.compute.internal" (SHA256) 17:89:50:8F:D2:2C:E1:DA:63:5A:54:7A:0B:86:D0:08:99:96:67:F4:B6:BB:21:F7:4A:45:58:FA:A5:80:35:72 (alt names: "DNS:puppet", "DNS:ip-172-31-3-96.us-east-2.compute.internal")
+ "ip-172-31-9-22.us-east-2.compute.internal" (SHA256) 88:0A:6E:36:76:67:04:7F:07:57:6D:70:1A:D6:08:26:29:3B:AE:B1:31:58:AC:CA:F7:C0:F6:01:2C:6C:52:A6
```

retry test / agent
```
# puppet agent --test --server ip-172-31-3-96.us-east-2.compute.internal
Info: Caching certificate for ip-172-31-9-22.us-east-2.compute.internal
Info: Caching certificate_revocation_list for ca
Info: Caching certificate for ip-172-31-9-22.us-east-2.compute.internal
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Caching catalog for ip-172-31-9-22.us-east-2.compute.internal
Info: Applying configuration version '1517400135'
Info: Creating state file /opt/puppetlabs/puppet/cache/state/state.yaml
Notice: Applied catalog in 0.01 seconds
```

manifests / master
```
cat << EOF > /etc/puppetlabs/code/environments/production/manifests/site.pp
node 'ip-172-31-9-22.us-east-2.compute.internal' {
          package { 'httpd' :
          ensure => installed,
                   }
}
EOF
```

apply configuration from manifests of master / agent
```
# yum list installed "httpd*"
Loaded plugins: langpacks, priorities, update-motd
Error: No matching Packages to list

# puppet agent --test --server ip-172-31-3-96.us-east-2.compute.internal
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Caching catalog for ip-172-31-9-22.us-east-2.compute.internal
Info: Applying configuration version '1517400509'
Notice: /Stage[main]/Main/Node[ip-172-31-9-22.us-east-2.compute.internal]/Package[httpd]/ensure: created
Notice: Applied catalog in 2.12 seconds

# yum list installed "httpd*"
Loaded plugins: langpacks, priorities, update-motd
Installed Packages
httpd.x86_64                                2.4.6-67.amzn2.6.1                           @amzn2-core
httpd-tools.x86_64                          2.4.6-67.amzn2.6.1                           @amzn2-core
```
