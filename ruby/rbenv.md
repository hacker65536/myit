# rbenv

https://github.com/rbenv/rbenv


install
--

```console
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```

```console 
$ cd ~/.rbenv && src/configure && make -C src
```

`bash`
```console
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
```

`fish`
```console
$ set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths
```


`bash`
```console
$ ~/.rbenv/bin/rbenv init
# Load rbenv automatically by appending
# the following to ~/.bash_profile:

eval "$(rbenv init -)"
```


`fish`
```
$ ~/.rbenv/bin/rbenv init
# Load rbenv automatically by appending
# the following to ~/.config/fish/config.fish:

status --is-interactive; and rbenv init - | source
```


verify

```console
$ curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
Checking for `rbenv' in PATH: /home/ec2-user/.rbenv/bin/rbenv
Checking for rbenv shims in PATH: OK
Checking `rbenv install' support: /home/linuxbrew/.linuxbrew/bin/rbenv-install (ruby-build 20200520)
Counting installed Ruby versions: none
  There aren't any Ruby versions installed under `/home/ec2-user/.rbenv/versions'.
  You can install Ruby versions like so: rbenv install 2.2.4
Checking RubyGems settings: OK
Auditing installed plugins: OK
```
