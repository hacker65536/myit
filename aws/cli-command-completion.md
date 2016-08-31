
```bash
cat /etc/bash_completion.d/aws_bash_completer
```

```bash
# Typically that would be added under one of the following paths:
# - /etc/bash_completion.d
# - /usr/local/etc/bash_completion.d
# - /usr/share/bash-completion/completions

complete -C aws_completer aws
```

```bash
cat /etc/bash_completion.d/aws_bash_completer | grep -Ev "^#|^$" >> ~/.bashrc
source ~/.bashrc
```
