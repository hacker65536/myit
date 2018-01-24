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


amazon-linux-extras

```
[ec2-user@ip-172-31-17-61 ~]$ sudo amazon-linux-extras install rust1
  0  ansible2   disabled  [ =2.4.2 ]
  1  emacs   disabled  [ =25.3 ]
  2  memcached1.5   disabled  [ =1.5.1 ]
  3  nginx1.12   disabled  [ =1.12.2 ]
  4  postgresql9.6   disabled  [ =9.6.6 ]
  5  python3   disabled  [ =3.6.2 ]
  6  redis4.0   disabled  [ =4.0.5 ]
  7  R3.4   disabled  [ =3.4.3 ]
  8  rust1=latest  enabled  [ =1.22.1 ]
  9  vim   disabled  [ =8.0 ]
 10  golang1.9   disabled  [ =1.9.2 ]
 11  ruby2.4   disabled  [ =2.4.2 ]
 12  nano   disabled  [ =2.9.1 ]
 13  php7.2   disabled  [ =7.2.0 ]
 14  lamp-mariadb10.2-php7.2   disabled  [ =10.2.10_7.2.0 ]
```
```
[ec2-user@ip-172-31-17-61 ~]$ sudo yum history
Loaded plugins: langpacks, priorities, update-motd
ID     | Command line             | Date and time    | Action(s)      | Altered
-------------------------------------------------------------------------------
     1 | install -q -y cargo rust | 2018-01-24 03:25 | Install        |   19
history list
[ec2-user@ip-172-31-17-61 ~]$ sudo yum history info 1
Loaded plugins: langpacks, priorities, update-motd
Transaction ID : 1
Begin time     : Wed Jan 24 03:25:53 2018
Begin rpmdb    : 412:e121aa5cbb6238b98eb2f1b333e451b29c509776
End time       :            03:26:04 2018 (11 seconds)
End rpmdb      : 431:a04acb4a7b0e1e35c5e119b6e3f085cf9e839d49
User           : EC2 Default User <ec2-user>
Return-Code    : Success
Command Line   : install -q -y cargo rust
Transaction performed with:
    Installed     rpm-4.11.3-25.amzn2.0.1.x86_64 installed
    Installed     yum-3.4.3-154.amzn2.0.1.noarch installed
Packages Altered:
    Install     cargo-0.23.0-1.1.amzn2.x86_64            @amzn2extra-rust1
    Dep-Install cpp-7.2.1-2.amzn2.0.2.x86_64             @amzn2-core
    Dep-Install gcc-7.2.1-2.amzn2.0.2.x86_64             @amzn2-core
    Dep-Install glibc-devel-2.25-10.amzn2.0.1.x86_64     @amzn2-core
    Dep-Install glibc-headers-2.25-10.amzn2.0.1.x86_64   @amzn2-core
    Dep-Install http-parser-2.7.1-5.amzn2.x86_64         @amzn2-core
    Dep-Install kernel-headers-4.9.76-38.79.amzn2.x86_64 @amzn2-core
    Dep-Install libatomic-7.2.1-2.amzn2.0.2.x86_64       @amzn2-core
    Dep-Install libcilkrts-7.2.1-2.amzn2.0.2.x86_64      @amzn2-core
    Dep-Install libgit2-0.24.6-2.amzn2.x86_64            @amzn2extra-rust1
    Dep-Install libitm-7.2.1-2.amzn2.0.2.x86_64          @amzn2-core
    Dep-Install libmpc-1.0.1-3.amzn2.x86_64              @amzn2-core
    Dep-Install libmpx-7.2.1-2.amzn2.0.2.x86_64          @amzn2-core
    Dep-Install libquadmath-7.2.1-2.amzn2.0.2.x86_64     @amzn2-core
    Dep-Install libsanitizer-7.2.1-2.amzn2.0.2.x86_64    @amzn2-core
    Dep-Install llvm3.9-libs-3.9.1-7.amzn2.x86_64        @amzn2extra-rust1
    Dep-Install mpfr-3.1.1-4.amzn2.x86_64                @amzn2-core
    Install     rust-1.22.1-1.1.amzn2.x86_64             @amzn2extra-rust1
    Dep-Install rust-std-static-1.22.1-1.1.amzn2.x86_64  @amzn2extra-rust1
history info
```
```
[ec2-user@ip-172-31-17-61 ~]$ rustc --version
rustc 1.22.1
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

