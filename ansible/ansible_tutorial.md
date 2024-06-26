```bash
mkdir ansible
cd !$
```

```bash
touch ansible_log
```
```
cat <<'EOF' > ansible.cfg
[defaults]
remote_user=centos
host_key_checking = False
log_path=ansible_log
EOF
```

```bash
cat <<'EOF' > hosts
[srv]
172.31.24.xxx
EOF
```
```bash

cat <<'EOF' > playbook.yml
- hosts: srv
  become: yes
  roles:
    - { role: '{{ platform }}/epel' }
EOF
```

```bash
mkdir -p roles/centos7/epel/tasks
cat <<'EOF' > !$/main.yml
- name: install epel-release
  yum: name=epel-release
EOF
```

```bash
ansible-playbook -i hosts playbook.yml --extra-vars platform=centos7
```
