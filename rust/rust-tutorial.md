https://www.rust-lang.org/en-US/index.html

https://www.rust-lang.org/ja-JP/

https://doc.rust-lang.org/book/first-edition/
http://rust-lang-ja.github.io/the-rust-programming-language-ja/1.6/book/


install
-----------

```
curl https://sh.rustup.rs -sSf | sh
```

```
Using username "ec2-user".
Authenticating with public key "imported-openssh-key"

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-28-192 ~]$ curl https://sh.rustup.rs -sSf | sh
info: downloading installer

Welcome to Rust!

This will download and install the official compiler for the Rust programming
language, and its package manager, Cargo.

It will add the cargo, rustc, rustup and other commands to Cargo's bin
directory, located at:

  /home/ec2-user/.cargo/bin

This path will then be added to your PATH environment variable by modifying the
profile files located at:

  /home/ec2-user/.profile
  /home/ec2-user/.bash_profile

You can uninstall at any time with rustup self uninstall and these changes will
be reverted.

Current installation options:

   default host triple: x86_64-unknown-linux-gnu
     default toolchain: stable
  modify PATH variable: yes

1) Proceed with installation (default)
2) Customize installation
3) Cancel installation


info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
info: latest update on 2018-01-04, rust version 1.23.0 (766bd11c8 2018-01-01)
info: downloading component 'rustc'
 45.0 MiB /  45.0 MiB (100 %)  20.4 MiB/s ETA:   0 s
info: downloading component 'rust-std'
 61.2 MiB /  61.2 MiB (100 %)  61.0 MiB/s ETA:   0 s
info: downloading component 'cargo'
info: downloading component 'rust-docs'
info: installing component 'rustc'
info: installing component 'rust-std'
info: installing component 'cargo'
info: installing component 'rust-docs'
info: default toolchain set to 'stable'

  stable installed - rustc 1.23.0 (766bd11c8 2018-01-01)


Rust is installed now. Great!

To get started you need Cargo's bin directory ($HOME/.cargo/bin) in your PATH
environment variable. Next time you log in this will be done automatically.

To configure your current shell run source $HOME/.cargo/env
[ec2-user@ip-172-31-28-192 ~]$ source $HOME/.cargo/env
[ec2-user@ip-172-31-28-192 ~]$ rustc --version
rustc 1.23.0 (766bd11c8 2018-01-01)
```

uninstalling
----------
```
rustup self uninstall
```
```
[ec2-user@ip-172-31-28-192 ~]$ rustup self uninstall


Thanks for hacking in Rust!

This will uninstall all Rust toolchains and data, and remove $HOME/.cargo/bin
from your PATH environment variable.

Continue? (y/N) y

info: removing rustup home
info: removing cargo home
info: removing rustup binaries
info: rustup is uninstalled
```

create a project file
------------
```
$ mkdir ~/projects
$ cd ~/projects
$ mkdir hello_world
$ cd hello_world
```
```
[ec2-user@ip-172-31-28-192 ~]$ mkdir ~/projects
[ec2-user@ip-172-31-28-192 ~]$ cd !$
cd ~/projects
[ec2-user@ip-172-31-28-192 projects]$ mkdir hello_world
[ec2-user@ip-172-31-28-192 projects]$ cd !$
cd hello_world
[ec2-user@ip-172-31-28-192 hello_world]$
```

writing and running a rust program
----------
```rust
fn main() {
    println!("Hello, world!");
}
```

```
cat << EOF > main.rs
fn main() {
    println!("Hello, world!");
}
EOF
```

