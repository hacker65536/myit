# nvm

Node Version Manager

https://github.com/creationix/nvm

install
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
