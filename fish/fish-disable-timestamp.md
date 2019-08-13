
# disable timestamp of fish prompt


put a blank file to config dir


disable
--
```console
$ touch ~/.config/fish/functions/fish_right_prompt.fish
```

enable
--

```console
$ rm ~/.config/fish/functions/fish_right_prompt.fish
```


ref
--

https://askubuntu.com/questions/1010641/how-to-remove-the-time-stamp-on-the-right-side-of-the-fish-shell


dont need a code as below

`~/.config/fish/functions/fish_right_prompt.fish`
```fish
 function fish_right_prompt
  #intentionally left blank
 end
 ```

