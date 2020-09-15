# fzf

https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew


install
--

```console
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ cd !$
```

```console
$ ./install
Downloading bin/fzf ...
  - Already exists
  - Checking fzf executable ... 0.22.0
Do you want to enable fuzzy auto-completion? ([y]/n) y
Do you want to enable key bindings? ([y]/n) y

Generate /home/ec2-user/.fzf.bash ... OK
Generate /home/ec2-user/.fzf.zsh ... OK
Update fish_user_paths ... OK
Symlink /home/ec2-user/.config/fish/functions/fzf_key_bindings.fish ... OK

Do you want to update your shell configuration files? ([y]/n) y

Update /home/ec2-user/.bashrc:
  - [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    - Already exists: line #30

Update /home/ec2-user/.zshrc:
  - [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    - Already exists: line #128

Update /home/ec2-user/.config/fish/functions/fish_user_key_bindings.fish:
  - fzf_key_bindings
    - Already exists: line #2

Finished. Restart your shell or reload config file.
   source ~/.bashrc  # bash
   source ~/.zshrc   # zsh
   fzf_key_bindings  # fish

Use uninstall script to remove fzf.

For more information, see: https://github.com/junegunn/fzf
```
