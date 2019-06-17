

| facts / OS                         | amazonlinux2 | centos7 | amazonlinux | centos6 | ubuntu18 |
|------------------------------------|--------------|---------|-------------|---------|----------|
| ansible_distribution               | Amazon       | CentOS  | Amazon      | CentOS  | Ubuntu   |
| ansible_distribution_major_version | 2            | 7       | NA          | 6       | 18       |
| ansible_service_mgr                | systemd      | systemd | upstart     | upstart | systemd  |
| ansible_os_family                  | RedHat       | RedHat  | RedHat      | RedHat  | Debian   |




```
ansible -m setup -i hosts 172.31.21.212
```




```
ansible -m ec2_facts  -i hosts 172.31.22.16
```
```
[DEPRECATION WARNING]: ec2_facts is kept for backwards compatibility but usage is discouraged. The module documentation details page may explain
 more about this rationale.. This feature will be removed in a future release. Deprecation warnings can be disabled by setting
deprecation_warnings=False in ansible.cfg.
```
ref
--
http://docs.ansible.com/ansible/latest/setup_module.html#status  
http://docs.ansible.com/ansible/latest/playbooks_variables.html  
https://docs.ansible.com/ansible/2.3/ec2_facts_module.html  
