https://www.rust-lang.org/en-US/index.html

https://www.rust-lang.org/ja-JP/

https://doc.rust-lang.org/book/first-edition/
http://rust-lang-ja.github.io/the-rust-programming-language-ja/1.6/book/


install
-----------

## Using rustup (recommended)

```
curl https://sh.rustup.rs -sSf | sh
```

```console
$ curl https://sh.rustup.rs -sSf | sh
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
>

info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
info: latest update on 2018-12-06, rust version 1.31.0 (abe02cefd 2018-12-04)
info: downloading component 'rustc'
info: downloading component 'rust-std'
info: downloading component 'cargo'
info: downloading component 'rust-docs'
info: installing component 'rustc'
info: installing component 'rust-std'
info: installing component 'cargo'
info: installing component 'rust-docs'
info: default toolchain set to 'stable'

  stable installed - rustc 1.31.0 (abe02cefd 2018-12-04)


Rust is installed now. Great!

To get started you need Cargo's bin directory ($HOME/.cargo/bin) in your PATH
environment variable. Next time you log in this will be done automatically.

To configure your current shell run source $HOME/.cargo/env
```

set path
```console
$ source $HOME/.cargo/env
```
or
```console
$ echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
```




amazon-linux-extras

```
$ sudo amazon-linux-extras
  0  ansible2                 available    [ =2.4.2  =2.4.6 ]
  2  httpd_modules            available    [ =1.0 ]
  3  memcached1.5             available    [ =1.5.1 ]
  4  nginx1.12                available    [ =1.12.2 ]
  5  postgresql9.6            available    [ =9.6.6  =9.6.8 ]
  6  postgresql10             available    [ =10 ]
  8  redis4.0                 available    [ =4.0.5  =4.0.10 ]
  9  R3.4                     available    [ =3.4.3 ]
 10  rust1=latest             enabled      \
        [ =1.22.1  =1.26.0  =1.26.1  =1.27.2 ]
 11  vim=latest               enabled      [ =8.0 ]
 12  golang1.9=latest         enabled      [ =1.9.2 ]
 13  ruby2.4                  available    [ =2.4.2  =2.4.4 ]
 15  php7.2                   available    \
        [ =7.2.0  =7.2.4  =7.2.5  =7.2.8  =7.2.11 ]
 16  php7.1                   available    [ =7.1.22 ]
 17  lamp-mariadb10.2-php7.2  available    \
        [ =10.2.10_7.2.0  =10.2.10_7.2.4  =10.2.10_7.2.5
          =10.2.10_7.2.8  =10.2.10_7.2.11 ]
 18  libreoffice              available    [ =5.0.6.2_15  =5.3.6.1 ]
 19  gimp                     available    [ =2.8.22 ]
 20  docker=latest            enabled      \
        [ =17.12.1  =18.03.1  =18.06.1 ]
 21  mate-desktop1.x          available    [ =1.19.0  =1.20.0 ]
 22  GraphicsMagick1.3        available    [ =1.3.29 ]
 23  tomcat8.5                available    [ =8.5.31  =8.5.32 ]
 24  epel=latest              enabled      [ =7.11 ]
 25  testing                  available    [ =1.0 ]
 26  ecs                      available    [ =stable ]
 27  corretto8                available    [ =1.8.0_192 ]
 28  firecracker              available    [ =0.11 ]
```

```console
$ sudo amazon-linux-extras install rust1
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

```
$ rustc main.rs
$ ./main
Hello, world!
```


cargo
--------

```
[ec2-user@ip-172-31-17-61 ~]$ cargo new hello_world --bin
     Created binary (application) `hello_world` project
     
[ec2-user@ip-172-31-17-61 ~]$ tree hello_world/
hello_world/
├── Cargo.toml
└── src
    └── main.rs

1 directory, 2 files
```

```
[ec2-user@ip-172-31-17-61 ~]$ cat hello_world/Cargo.toml
[package]
name = "hello_world"
version = "0.1.0"
authors = ["ec2-user"]

[dependencies]
[ec2-user@ip-172-31-17-61 ~]$ cat hello_world/src/main.rs
fn main() {
    println!("Hello, world!");
}
```

```
[ec2-user@ip-172-31-17-61 ~]$ cd hello_world/
[ec2-user@ip-172-31-17-61 hello_world]$ cargo build
   Compiling hello_world v0.1.0 (file:///home/ec2-user/hello_world)
    Finished dev [unoptimized + debuginfo] target(s) in 0.27 secs
[ec2-user@ip-172-31-17-61 hello_world]$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.0 secs
     Running `target/debug/hello_world`
Hello, world!
[ec2-user@ip-172-31-17-61 hello_world]$ tree
.
├── Cargo.lock
├── Cargo.toml
├── src
│   └── main.rs
└── target
    └── debug
        ├── build
        ├── deps
        │   └── hello_world-52f63d9040e30e53
        ├── examples
        ├── hello_world
        ├── hello_world.d
        ├── incremental
        └── native

8 directories, 6 files
```
