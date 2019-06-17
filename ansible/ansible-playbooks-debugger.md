# ansible debbuger

https://docs.ansible.com/ansible/latest/user_guide/playbooks_debugger.html


- always
- never
- on_failed
- on_unreachable
- on_skipped

on a task
```yml
- name: Execute a command
  command: false
  debugger: on_failed
```

on a play
```
- name: Play
  hosts: all
  debugger: on_skipped
  tasks:
    - name: Execute a command
      command: true
      when: False
```

in ansible.cfg
```
[defaults]
enable_task_debugger = True
```

env
```
ANSIBLE_ENABLE_TASK_DEBUGGER=True ansible-playbook -i hosts site.yml
```



available commands

- p  print task/task_vars/host/result
```
[192.0.2.10] TASK: install package (debug)> p task
TASK: install package
[192.0.2.10] TASK: install package (debug)> p task.args
{u'name': u'{{ pkg_name }}'}
[192.0.2.10] TASK: install package (debug)> p task_vars
{u'ansible_all_ipv4_addresses': [u'192.0.2.10'],
 u'ansible_architecture': u'x86_64',
 ...
}
[192.0.2.10] TASK: install package (debug)> p task_vars['pkg_name']
u'bash'
[192.0.2.10] TASK: install package (debug)> p host
192.0.2.10
[192.0.2.10] TASK: install package (debug)> p result._result
{'_ansible_no_log': False,
 'changed': False,
 u'failed': True,
 ...
 u'msg': u"No package matching 'not_exist' is available"}
 ```
 
 
 task.args[key] = value
 ```yml
 - hosts: test
  strategy: debug
  gather_facts: yes
  vars:
    pkg_name: not_exist
  tasks:
    - name: install package
      apt: name={{ pkg_name }}
```
```
[192.0.2.10] TASK: install package (debug)> p task.args
{u'name': u'{{ pkg_name }}'}
[192.0.2.10] TASK: install package (debug)> task.args['name'] = 'bash'
[192.0.2.10] TASK: install package (debug)> p task.args
{u'name': 'bash'}
[192.0.2.10] TASK: install package (debug)> redo
```

- u update_task
- r redo
- c continue
- q quit

