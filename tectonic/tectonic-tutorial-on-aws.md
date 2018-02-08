
Getting started with CoreOS Tectonic
--------------

https://coreos.com/tectonic/docs/latest/account/

1. CoreOS account  
Sign up from https://account.coreos.com/login 

2. License and Pull Secret  
Download from login page (CoreOS)

3. AWS account  
Sign up from https://portal.aws.amazon.com/billing/signup#/start

4. Domain Name  
Register a domain https://domains.google/#  

5. Hosted Zone
Create Hosted Zone in route53  
and siwtch custom name servers in google domain

6. SSH key  
Create key pair in EC2 console

7. Login secrets  
Email(ID) and Password


Configure and Install
--------------

```
$ cat /proc/version
Linux version 4.9.76-3.78.amzn1.x86_64 (mockbuild@gobi-build-60009) (gcc version 7.2.1 20170915 (Red Hat 7.2.1-2) (GCC) ) #1 SMP Fri Jan 12 19:51:35 UTC 2018
```

```
curl -SsO https://releases.tectonic.com/releases/tectonic_1.8.4-tectonic.3.zip
curl -SsO https://releases.tectonic.com/releases/tectonic_1.8.4-tectonic.3.zip.sig
```

```
$ gpg2 --keyserver pgp.mit.edu --recv-key 18AD5014C99EF7E3BA5F6CE950BDD3E0FC8A365E
gpg: directory `/home/ec2-user/.gnupg' created
gpg: new configuration file `/home/ec2-user/.gnupg/gpg.conf' created
gpg: WARNING: options in `/home/ec2-user/.gnupg/gpg.conf' are not yet active during this run
gpg: keyring `/home/ec2-user/.gnupg/secring.gpg' created
gpg: keyring `/home/ec2-user/.gnupg/pubring.gpg' created
gpg: requesting key FC8A365E from hkp server pgp.mit.edu
gpg: /home/ec2-user/.gnupg/trustdb.gpg: trustdb created
gpg: key FC8A365E: public key "CoreOS Application Signing Key <security@coreos.com>" imported
gpg: no ultimately trusted keys found
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)
```
```
$ gpg2 --verify tectonic_1.8.4-tectonic.3.zip.sig tectonic_1.8.4-tectonic.3.zip
gpg: Signature made Fri 05 Jan 2018 02:34:52 AM UTC using RSA key ID BEDDBA18
gpg: Good signature from "CoreOS Application Signing Key <security@coreos.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 18AD 5014 C99E F7E3 BA5F  6CE9 50BD D3E0 FC8A 365E
     Subkey fingerprint: 55DB DA91 BBE1 849E A27F  E733 A6F7 1EE5 BEDD BA18
```

```
unzip tectonic_1.8.4-tectonic.3.zip
cd tectonic_1.8.4-tectonic.3
```

```
export PATH=$(pwd)/tectonic-installer/linux:$PATH
```

```
$ whereis terraform
terraform: /home/ec2-user/tectonic_1.8.4-tectonic.3/tectonic-installer/linux/terraform

$ terraform -v
Terraform v0.10.7

Your version of Terraform is out of date! The latest version
is 0.11.3. You can update by downloading from www.terraform.io/downloads.html
```





