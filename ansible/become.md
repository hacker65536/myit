centos


user_data
```yml
#cloud-config

disable_root: False
```

packer.json
```json
"builders": [{
"ssh_username": "root",
"ssh_pty": "true",
}],
  "provisioners": [{
        "type": "ansible",
        "playbook_file": "{{user `playbook_file`}}",
        "use_sftp": "false",
        "ansible_env_vars": [
            "ANSIBLE_HOST_KEY_CHECKING=False"
        ]
    }]
```


ansible
```yml
 - hosts: all
    become: yes
    roles:
      - epel
```
