
```bash
vim ~/.screenrc
```

```
escape ^z^z
# ctrl+z
termcapinfo xterm 'is=\E[r\E[m\E[2J\E[H\E[?7h\E[?1;4;6l'
# escape screen resize for xterm

#termcapinfo kterm-color 'is=\E[r\E[m\E[2J\E[H\E[?7h\E[?1;4;6l'
# escape screen resize for kterm-color
```

##copy paste

* `ctrl+z` change mode for screen cmd  
* `[` copy mode start  
* `h` or `j` or `k` or `l` mv cursor  
* `shift+y` copy mode end
* `y` copy and continue  
* `W` copy word  
* `]` paste  
