
https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/7/html/networking_guide/sec_configuring_host_names_using_hostnamectl

```
# hostnamectl status
   Static hostname: ip-172-31-45-123.us-east-2.compute.internal
         Icon name: computer-vm
           Chassis: vm
        Machine ID: cc1656a321e840ddb201d9a13ec03de8
           Boot ID: ca05ca968c9a4f05a19872aa76e5b0b8
    Virtualization: xen
  Operating System: Amazon Linux 2.0 (2017.12) LTS Release Candidate
       CPE OS Name: cpe:2.3:o:amazon:amazon_linux:2.0
            Kernel: Linux 4.9.75-1.56.amzn2.x86_64
      Architecture: x86-64
```


set hostname
```
hostnamectl set-hostname customhostname
```


pretty,static, transient
