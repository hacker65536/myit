
`~/.gitconfig`
```gitconfig
[secrets]
  providers = git secrets --aws-provider
  patterns = (A3T[A-Z0-9]|AKIA|AGPA|AIDA|AROA|AIPA|ANPA|ANVA|ASIA)[A-Z0-9]{16}
  patterns = (\"|')?(AWS|aws|Aws)?_?(SECRET|secret|Secret)?_?(ACCESS|access|Access)?_?(KEY|key|Key)(\"|')?\\s*(:|=>|=)\\s*(\"|')?[A-Za-z0-9/\\+=]{40}(\"|')?
  patterns = (\"|')?(AWS|aws|Aws)?_?(ACCOUNT|account|Account)_?(ID|id|Id)?(\"|')?\\s*(:|=>|=)\\s*(\"|')?[0-9]{4}\\-?[0-9]{4}\\-?[0-9]{4}(\"|')?
  allowed = AKIAIOSFODNN7EXAMPLE
  allowed = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
  allowed = 123456789012
[alias]
  co = checkout
  br = branch
  ci = commit
  st = status
  last = log -1 HEAD
  graph = log --graph --date-order -C -M --pretty=format:\"<%h> %ad [%an] %Cgreen%d%Creset %s\" --all --date=short
[push]
  default = current
[hub]
  protocol = https
[diff "sopsdiffer"]
  textconv = "sops -d"
[grep "sopsdiffer"]
  textconv = "sops -d"
[credential "https://github.com/myname/*"]
  helper = store --file ~/.myname-credentials
[diff "ansible-vault"]
  textconv = ansible-vault view
  cachetextconv = true
[grep "ansible-vault"]
  textconv = ansible-vault view
  cachetextconv = true
[diff "vault"]
  textconv = ansible-vault view
  cachetextconv = true
[grep "vault"]
  textconv = ansible-vault view
  cachetextconv = true
[format]
  pretty = format:"%C(auto)[%as] %h %<(18)%an : %s"
[pull]
  rebase = true
[core]
  editor = vim
  pager = less -R -F -X
[init]
  defaultBranch = main
```

`.gitattributes`
```
/paht/ansible-repo/*.yml diff=ansible-vault grep=ansible-vault merge=binary
/path/secrets.yaml diff=sopsdiffer grep=sopsdiffer
```
