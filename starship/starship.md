# starship 

https://starship.rs/


install
--

require libssl.so.1.1

```console 
$ sudo yum install openssl11-libs
```

do with root
```console
$ curl -fsSL https://starship.rs/install.sh | bash
```


### bash

```bash
# ~/.bashrc

eval "$(starship init bash)"
```


### fish

```fish
# ~/.config/fish/config.fish

starship init fish | source
```

## configure

https://starship.rs/config/

```console
$ mkdir -p ~/.config && touch ~/.config/starship.toml
```
