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
