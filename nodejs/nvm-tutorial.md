# nvm

Node Version Manager

https://github.com/nvm-sh/nvm

install nvm
--
```console
$ curl -Ss -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
=> nvm is already installed in /home/ec2-user/.nvm, trying to update the script

=> Appending nvm source string to /home/ec2-user/.bashrc
=> Appending bash_completion source string to /home/ec2-user/.bashrc
=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

```console
$ source ~/.bashrc
```

### fish

require bass

```
$ omf install bass
```

`~/.config/fish/functions/nvm.fish`
```fish
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
```

`~/.config/fish/functions/nvm_find_nvmrc.fish`
```fish
function nvm_find_nvmrc
  bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
end
```
`~/.config/fish/functions/load_nvm.fish`
```fish
function load_nvm --on-variable="PWD"
  set -l default_node_version (nvm version default)
  set -l node_version (nvm version)
  set -l nvmrc_path (nvm_find_nvmrc)
  if test -n "$nvmrc_path"
    set -l nvmrc_node_version (nvm version (cat $nvmrc_path))
    if test "$nvmrc_node_version" = "N/A"
      nvm install $nvmrc_node_version
    else if test nvmrc_node_version != node_version
      nvm use $nvmrc_node_version
    end
  else if test "$node_version" != "$default_node_version"
    echo "Reverting to default Node version"
    nvm use default
  end
end
```

`~/.config/fish/config.fish`
```fish
# You must call it on initialization or listening to directory switching won't work
load_nvm
```

install node
--
```console
$ nvm install node
Downloading and installing node v11.10.0...
Downloading https://nodejs.org/dist/v11.10.0/node-v11.10.0-linux-x64.tar.xz...
######################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v11.10.0 (npm v6.7.0)
Creating default alias: default -> node (-> v11.10.0)
```

```console
$ cat <<'EOF' > index.js
console.log(process.version);
EOF
```
```console
$ node index.js
v11.10.0
```
list (local)
--
```console
$ nvm ls
->     v11.10.0
default -> node (-> v11.10.0)
node -> stable (-> v11.10.0) (default)
stable -> 11.10 (-> v11.10.0) (default)
iojs -> N/A (default)
unstable -> N/A (default)
lts/* -> lts/dubnium (-> N/A)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.16.0 (-> N/A)
lts/carbon -> v8.15.0 (-> N/A)
lts/dubnium -> v10.15.1 (-> N/A)
```

list remote
--
```console
$ nvm ls-remote --lts | tail -10
        v8.13.0   (LTS: Carbon)
        v8.14.0   (LTS: Carbon)
        v8.14.1   (LTS: Carbon)
        v8.15.0   (Latest LTS: Carbon)
       v10.13.0   (LTS: Dubnium)
       v10.14.0   (LTS: Dubnium)
       v10.14.1   (LTS: Dubnium)
       v10.14.2   (LTS: Dubnium)
       v10.15.0   (LTS: Dubnium)
       v10.15.1   (Latest LTS: Dubnium)
```

install lts
--
```console
$ nvm install --lts
Installing latest LTS version.
Downloading and installing node v10.15.1...
Local cache found: $NVM_DIR/.cache/bin/node-v10.15.1-linux-x64/node-v10.15.1-linux-x64.tar.xz
Checksums match! Using existing downloaded archive $NVM_DIR/.cache/bin/node-v10.15.1-linux-x64/node-v10.15.1-linux-x64.tar.xz
Now using node v10.15.1 (npm v6.4.1)
```
or 
```console
$ nvm install v10.15.1
Downloading and installing node v10.15.1...
Downloading https://nodejs.org/dist/v10.15.1/node-v10.15.1-linux-x64.tar.xz...
######################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v10.15.1 (npm v6.4.1)
```


switch and uninstall
--

```console
$ nvm ls
->     v10.15.1
       v11.10.0
default -> node (-> v11.10.0)
node -> stable (-> v11.10.0) (default)
stable -> 11.10 (-> v11.10.0) (default)
iojs -> N/A (default)
unstable -> N/A (default)
lts/* -> lts/dubnium (-> v10.15.1)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.16.0 (-> N/A)
lts/carbon -> v8.15.0 (-> N/A)
lts/dubnium -> v10.15.1
```

```console
$ node index.js
v10.15.1
```

```console
$ nvm use node
Now using node v11.10.0 (npm v6.7.0)
```
```console
$ nvm ls
       v10.15.1
->     v11.10.0
default -> node (-> v11.10.0)
node -> stable (-> v11.10.0) (default)
stable -> 11.10 (-> v11.10.0) (default)
iojs -> N/A (default)
unstable -> N/A (default)
lts/* -> lts/dubnium (-> v10.15.1)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.16.0 (-> N/A)
lts/carbon -> v8.15.0 (-> N/A)
lts/dubnium -> v10.15.1
```
```console
$ nvm uninstall --lts
Uninstalled node v10.15.1
```



tips
--

if get message as below 
```
N/A: version "N/A -> N/A" is not yet installed.

You need to run "nvm install N/A" to install it before using it.
```

```console
$ nvm ls
->      v8.10.0
       v10.16.1
default -> lts/* (-> N/A)
```
```console
$ nvm install --lts
```

```console
$ nvm ls
        v8.10.0
       v10.16.1
->     v10.16.3
default -> lts/* (-> v10.16.3)
```
