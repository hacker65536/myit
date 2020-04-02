# fish Command line editor
https://fishshell.com/docs/current/#command-line-editor


enable disable
--
`fish_vi_key_bindings` 
`fish_default_key_bindings`


hibrid_bindings
--

`~/.config/fish/function/hybrid_bindings.fish`
```fish
function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings
```

example
--

```
$ hybrid_bindings
```
