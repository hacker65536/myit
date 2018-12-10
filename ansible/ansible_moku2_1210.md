
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

## processing

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
