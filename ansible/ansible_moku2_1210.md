
## Linklight Workshop
https://github.com/network-automation/linklight

https://github.com/network-automation/linklight/blob/master/exercises/networking/README.ja.md

## Ansible Towerに関する参考資料
https://www.slideshare.net/ssuserf487dc/ansible-tower

## environment
```
student18-ansible ansible_host=3.0.90.222 ansible_user=student18 ansible_ssh_pass=red123hat
student18-rtr1 ansible_host=3.0.100.243 ansible_user=student18 ansible_ssh_pass=red123hat
student18-rtr2 ansible_host=52.77.212.166 ansible_user=student18 ansible_ssh_pass=red123hat
student18-host1 ansible_host=18.136.202.135 ansible_user=student18 ansible_ssh_pass=red123hat
```

## Exercise 1.1 Running Ad-hoc commands

```
[student18@ansible ~]$ ls -la
total 20
drwx------.  5 student18 student18 148 Dec 10 08:54 .
drwxr-xr-x.  4 root      root       39 Dec 10 08:50 ..
-rw-r--r--.  1 student18 student18 222 Dec 10 08:53 .ansible.cfg
-rw-r--r--.  1 student18 student18  18 Mar  7  2017 .bash_logout
-rw-r--r--.  1 student18 student18 193 Mar  7  2017 .bash_profile
-rw-r--r--.  1 student18 student18 231 Mar  7  2017 .bashrc
drwxr-xr-x.  4 root      root       42 Dec 10 08:54 demos
drwxr-xr-x. 11 student18 student18 264 Dec 10 08:54 networking-workshop
drwxr-xr-x.  2 student18 student18  43 Dec 10 08:54 .ssh
-rw-r--r--.  1 student18 student18 348 Dec 10 08:53 .vimrc
[student18@ansible ~]$ cat /etc/redhat-release
Red Hat Enterprise Linux Server release 7.4 (Maipo)
[student18@ansible ~]$ ansible control -m ping
ansible | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```
```
[student18@ansible ~]$ ansible control -m command -a "uptime" -o

ansible | CHANGED | rc=0 | (stdout)  11:1
```
```
[student18@ansible ~]$ ansible routers -m ios_facts -c network_cli
rtr1 | SUCCESS => {
    "ansible_facts": {
        "ansible_net_all_ipv4_addresses": [
            "172.16.148.0",
            "192.168.35.101"
        ],
        "ansible_net_all_ipv6_addresses": [],
        "ansible_net_filesystems": [
            "bootflash:"
        ],
        "ansible_net_filesystems_info": {
            "bootflash:": {
                "spacefree_kb": 6897204,
                "spacetotal_kb": 7712284
            }
        },
        "ansible_net_gather_subset": [
            "hardware",
            "default",
            "interfaces"
        ],
        "ansible_net_hostname": "ip-172-16-148-0",
        "ansible_net_image": "boot:packages.conf",
        "ansible_net_interfaces": {
            "GigabitEthernet1": {
                "bandwidth": 1000000,
                "description": null,
                "duplex": "Full",
                "ipv4": [
                    {
                        "address": "172.16.148.0",
                        "subnet": "16"
                    }
                ],
                "lineprotocol": "up ",
                "macaddress": "0217.9eb2.ef88",
                "mediatype": "Virtual",
                "mtu": 1500,
                "operstatus": "up",
                "type": "CSR vNIC"
            },
            "VirtualPortGroup0": {
                "bandwidth": 750000,
                "description": null,
                "duplex": null,
                "ipv4": [
                    {
                        "address": "192.168.35.101",
                        "subnet": "24"
                    }
                ],
                "lineprotocol": "up ",
                "macaddress": "001e.bd3c.eabd",
                "mediatype": null,
                "mtu": 1500,
                "operstatus": "up",
                "type": "Virtual Port Group"
            }
        },
        "ansible_net_memfree_mb": 1861599,
        "ansible_net_memtotal_mb": 2180876,
        "ansible_net_model": "CSR1000V",
        "ansible_net_serialnum": "9QB2MMBDHFT",
        "ansible_net_version": "16.09.01"
    },
    "changed": false
}
rtr2 | SUCCESS => {
    "ansible_facts": {
        "ansible_net_all_ipv4_addresses": [
            "172.17.23.141",
            "192.168.35.101"
        ],
        "ansible_net_all_ipv6_addresses": [],
        "ansible_net_filesystems": [
            "bootflash:"
        ],
        "ansible_net_filesystems_info": {
            "bootflash:": {
                "spacefree_kb": 6897208,
                "spacetotal_kb": 7712284
            }
        },
        "ansible_net_gather_subset": [
            "hardware",
            "default",
            "interfaces"
        ],
        "ansible_net_hostname": "ip-172-17-23-141",
        "ansible_net_image": "boot:packages.conf",
        "ansible_net_interfaces": {
            "GigabitEthernet1": {
                "bandwidth": 1000000,
                "description": null,
                "duplex": "Full",
                "ipv4": [
                    {
                        "address": "172.17.23.141",
                        "subnet": "16"
                    }
                ],
                "lineprotocol": "up ",
                "macaddress": "02f4.ba49.121e",
                "mediatype": "Virtual",
                "mtu": 1500,
                "operstatus": "up",
                "type": "CSR vNIC"
            },
            "VirtualPortGroup0": {
                "bandwidth": 750000,
                "description": null,
                "duplex": null,
                "ipv4": [
                    {
                        "address": "192.168.35.101",
                        "subnet": "24"
                    }
                ],
                "lineprotocol": "up ",
                "macaddress": "001e.4942.bcbd",
                "mediatype": null,
                "mtu": 1500,
                "operstatus": "up",
                "type": "Virtual Port Group"
            }
        },
        "ansible_net_memfree_mb": 1861444,
        "ansible_net_memtotal_mb": 2180876,
        "ansible_net_model": "CSR1000V",
        "ansible_net_serialnum": "9MR1BGDXDEQ",
        "ansible_net_version": "16.09.01"
    },
    "changed": false
}
```
```
$ ansible routers -m ios_command -a 'commands="show ip int br"' -c network_cli
rtr1 | SUCCESS => {
    "changed": false,
    "stdout": [
        "Interface              IP-Address      OK? Method Status                Protocol\nGigabitEthernet1       172.16.148.0    YES DHCP   up                    up      \nVirtualPortGroup0      192.168.35.101  YES TFTP   up                    up"
    ],
    "stdout_lines": [
        [
            "Interface              IP-Address      OK? Method Status                Protocol",
            "GigabitEthernet1       172.16.148.0    YES DHCP   up                    up      ",
            "VirtualPortGroup0      192.168.35.101  YES TFTP   up                    up"
        ]
    ]
}
rtr2 | SUCCESS => {
    "changed": false,
    "stdout": [
        "Interface              IP-Address      OK? Method Status                Protocol\nGigabitEthernet1       172.17.23.141   YES DHCP   up                    up      \nVirtualPortGroup0      192.168.35.101  YES TFTP   up                    up"
    ],
    "stdout_lines": [
        [
            "Interface              IP-Address      OK? Method Status                Protocol",
            "GigabitEthernet1       172.17.23.141   YES DHCP   up                    up      ",
            "VirtualPortGroup0      192.168.35.101  YES TFTP   up                    up"
        ]
    ]
}
```
```
[student18@ansible ~]$ ansible routers -m ios_command -a 'commands="show banner motd"' -c network_cli
rtr1 | SUCCESS => {
    "changed": false,
    "stdout": [
        ""
    ],
    "stdout_lines": [
        [
            ""
        ]
    ]
}
rtr2 | SUCCESS => {
    "changed": false,
    "stdout": [
        ""
    ],
    "stdout_lines": [
        [
            ""
        ]
    ]
}
```
```
[student18@ansible ~]$ ansible routers -m ios_banner -a 'banner=motd text="Ansible is awesome!" state=present' -c network_cli
rtr2 | CHANGED => {
    "changed": true,
    "commands": [
        "banner motd @\nAnsible is awesome!\n@"
    ]
}
rtr1 | CHANGED => {
    "changed": true,
    "commands": [
        "banner motd @\nAnsible is awesome!\n@"
    ]
}
```
```
[student18@ansible ~]$ ansible routers -m ios_command -a 'commands="show banner motd"' -c network_cli
rtr1 | SUCCESS => {
    "changed": false,
    "stdout": [
        "Ansible is awesome!"
    ],
    "stdout_lines": [
        [
            "Ansible is awesome!"
        ]
    ]
}
rtr2 | SUCCESS => {
    "changed": false,
    "stdout": [
        "Ansible is awesome!"
    ],
    "stdout_lines": [
        [
            "Ansible is awesome!"
        ]
    ]
}
```
```
[student18@ansible ~]$ ansible routers -m ios_banner -a 'banner=motd state=absent' -c network_cli
rtr2 | CHANGED => {
    "changed": true,
    "commands": [
        "no banner motd"
    ]
}
rtr1 | CHANGED => {
    "changed": true,
    "commands": [
        "no banner motd"
    ]
}
[student18@ansible ~]$ ansible routers -m ios_command -a 'commands="show banner motd"' -c network_cli
rtr1 | SUCCESS => {
    "changed": false,
    "stdout": [
        ""
    ],
    "stdout_lines": [
        [
            ""
        ]
    ]
}
rtr2 | SUCCESS => {
    "changed": false,
    "stdout": [
        ""
    ],
    "stdout_lines": [
        [
            ""
        ]
    ]
}
```

## Exercise 1.2 Backing up Configurations

```
[student18@ansible ~]$ cd ~/networking-workshop/
[student18@ansible networking-workshop]$ ansible --version
ansible 2.7.4
  config file = /home/student18/.ansible.cfg
  configured module search path = [u'/home/student18/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python2.7/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 2.7.5 (default, May  3 2017, 07:55:04) [GCC 4.8.5 20150623 (Red Hat 4.8.5-14)]
```

```
[student18@ansible networking-workshop]$ cat ~/.ansible.cfg
[defaults]
connection = smart
timeout = 60
deprecation_warnings = False
inventory = /home/student18/networking-workshop/lab_inventory/hosts
host_key_checking = False
private_key_file = /home/student18/.ssh/aws-private.pem
```
```
[student18@ansible networking-workshop]$ cat ~/networking-workshop/lab_inventory/hosts
[all:vars]
ansible_user=student18
ansible_ssh_pass=red123hat
ansible_port=22

[routers:children]
cisco

[cisco]
rtr1 ansible_host=3.0.100.243 ansible_ssh_user=ec2-user private_ip=172.16.148.0 ansible_network_os=ios
rtr2 ansible_host=52.77.212.166 ansible_ssh_user=ec2-user private_ip=172.17.23.141 ansible_network_os=ios


[cisco:vars]
ansible_ssh_user=ec2-user
ansible_network_os=ios


[dc1]
rtr1

[dc2]
rtr2

[hosts]
host1 ansible_host=18.136.202.135 ansible_ssh_user=ec2-user private_ip=172.17.99.63

[control]
ansible ansible_host=3.0.90.222 ansible_ssh_user=ec2-user private_ip=172.16.50.135
```

```yml

---
- name: backup router configurations
  hosts: routers
  connection: network_cli
  gather_facts: no

  tasks:
    - name: gather ios_facts
      ios_facts:
      register: version

    - debug:
        msg: "{{version}}"

    - name: Backup configuration
      ios_config:
        backup: yes
```

```
[student18@ansible networking-workshop]$ ansible-playbook backup.yml

PLAY [backup router configurations] *********************************************************

TASK [gather ios_facts] *********************************************************************
ok: [rtr2]
ok: [rtr1]

TASK [debug] ********************************************************************************
ok: [rtr1] => {
    "msg": {
        "ansible_facts": {
            "ansible_net_all_ipv4_addresses": [
                "172.16.148.0",
                "192.168.35.101"
            ],
            "ansible_net_all_ipv6_addresses": [],
            "ansible_net_filesystems": [
                "bootflash:"
            ],
            "ansible_net_filesystems_info": {
                "bootflash:": {
                    "spacefree_kb": 6897196,
                    "spacetotal_kb": 7712284
                }
            },
            "ansible_net_gather_subset": [
                "hardware",
                "default",
                "interfaces"
            ],
            "ansible_net_hostname": "ip-172-16-148-0",
            "ansible_net_image": "boot:packages.conf",
            "ansible_net_interfaces": {
                "GigabitEthernet1": {
                    "bandwidth": 1000000,
                    "description": null,
                    "duplex": "Full",
                    "ipv4": [
                        {
                            "address": "172.16.148.0",
                            "subnet": "16"
                        }
                    ],
                    "lineprotocol": "up ",
                    "macaddress": "0217.9eb2.ef88",
                    "mediatype": "Virtual",
                    "mtu": 1500,
                    "operstatus": "up",
                    "type": "CSR vNIC"
                },
                "VirtualPortGroup0": {
                    "bandwidth": 750000,
                    "description": null,
                    "duplex": null,
                    "ipv4": [
                        {
                            "address": "192.168.35.101",
                            "subnet": "24"
                        }
                    ],
                    "lineprotocol": "up ",
                    "macaddress": "001e.bd3c.eabd",
                    "mediatype": null,
                    "mtu": 1500,
                    "operstatus": "up",
                    "type": "Virtual Port Group"
                }
            },
            "ansible_net_memfree_mb": 1861599,
            "ansible_net_memtotal_mb": 2180876,
            "ansible_net_model": "CSR1000V",
            "ansible_net_serialnum": "9QB2MMBDHFT",
            "ansible_net_version": "16.09.01"
        },
        "changed": false,
        "failed": false
    }
}
ok: [rtr2] => {
    "msg": {
        "ansible_facts": {
            "ansible_net_all_ipv4_addresses": [
                "172.17.23.141",
                "192.168.35.101"
            ],
            "ansible_net_all_ipv6_addresses": [],
            "ansible_net_filesystems": [
                "bootflash:"
            ],
            "ansible_net_filesystems_info": {
                "bootflash:": {
                    "spacefree_kb": 6897204,
                    "spacetotal_kb": 7712284
                }
            },
            "ansible_net_gather_subset": [
                "hardware",
                "default",
                "interfaces"
            ],
            "ansible_net_hostname": "ip-172-17-23-141",
            "ansible_net_image": "boot:packages.conf",
            "ansible_net_interfaces": {
                "GigabitEthernet1": {
                    "bandwidth": 1000000,
                    "description": null,
                    "duplex": "Full",
                    "ipv4": [
                        {
                            "address": "172.17.23.141",
                            "subnet": "16"
                        }
                    ],
                    "lineprotocol": "up ",
                    "macaddress": "02f4.ba49.121e",
                    "mediatype": "Virtual",
                    "mtu": 1500,
                    "operstatus": "up",
                    "type": "CSR vNIC"
                },
                "VirtualPortGroup0": {
                    "bandwidth": 750000,
                    "description": null,
                    "duplex": null,
                    "ipv4": [
                        {
                            "address": "192.168.35.101",
                            "subnet": "24"
                        }
                    ],
                    "lineprotocol": "up ",
                    "macaddress": "001e.4942.bcbd",
                    "mediatype": null,
                    "mtu": 1500,
                    "operstatus": "up",
                    "type": "Virtual Port Group"
                }
            },
            "ansible_net_memfree_mb": 1861444,
            "ansible_net_memtotal_mb": 2180876,
            "ansible_net_model": "CSR1000V",
            "ansible_net_serialnum": "9MR1BGDXDEQ",
            "ansible_net_version": "16.09.01"
        },
        "changed": false,
        "failed": false
    }
}

TASK [Backup configuration] *****************************************************************
ok: [rtr1]
ok: [rtr2]

PLAY RECAP **********************************************************************************
rtr1                       : ok=3    changed=0    unreachable=0    failed=0
rtr2                       : ok=3    changed=0    unreachable=0    failed=0

```

```
[student18@ansible networking-workshop]$ ls -la backup
total 20
drwxrwxr-x.  2 student18 student18   84 Dec 10 11:29 .
drwxr-xr-x. 12 student18 student18 4096 Dec 10 11:29 ..
-rw-rw-r--.  1 student18 student18 4335 Dec 10 11:29 rtr1_config.2018-12-10@11:29:51
-rw-rw-r--.  1 student18 student18 4336 Dec 10 11:29 rtr2_config.2018-12-10@11:29:51
```

```
[student18@ansible networking-workshop]$ ansible-playbook backup.yml --syntax-check

playbook: backup.yml
```

## Exercise 1.3 

```
[student18@host1 ~]$ hostname -I
172.17.99.63
[student18@host1 ~]$ curl checkip.amazonaws.com
18.136.202.135
```

```
[student18@ansible networking-workshop]$ ping -c 3 18.136.202.135
PING 18.136.202.135 (18.136.202.135) 56(84) bytes of data.
64 bytes from 18.136.202.135: icmp_seq=1 ttl=63 time=0.621 ms
64 bytes from 18.136.202.135: icmp_seq=2 ttl=63 time=0.505 ms
64 bytes from 18.136.202.135: icmp_seq=3 ttl=63 time=0.564 ms

--- 18.136.202.135 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2000ms
rtt min/avg/max/mdev = 0.505/0.563/0.621/0.051 ms
[student18@ansible networking-workshop]$ ping -c 3 172.17.99.63
PING 172.17.99.63 (172.17.99.63) 56(84) bytes of data.

--- 172.17.99.63 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, tim
```
