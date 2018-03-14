
http://docs.ansible.com/ansible/latest/setup_module.html#status  
http://docs.ansible.com/ansible/latest/playbooks_variables.html  
https://docs.ansible.com/ansible/2.3/ec2_facts_module.html  

```
ansible -m setup -i hosts 172.31.21.212
```

```
ansible -m ec2_facts  -i hosts 172.31.22.16
```
