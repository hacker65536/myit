## settings
```bash
vim ~/.screenrc
```

```
escape ^Z^Z
# "^Z" is a control code.  input this code ctrl+v > ctrl+z 
termcapinfo xterm 'is=\E[r\E[m\E[2J\E[H\E[?7h\E[?1;4;6l'
# escape screen resize for xterm

#termcapinfo kterm-color 'is=\E[r\E[m\E[2J\E[H\E[?7h\E[?1;4;6l'
# escape screen resize for kterm-color
```
##operation
```bash
screen -ls
```

```bash
screen -r <process number>
```

```bash
screen -x <session name>
```

##copy and  paste

* `ctrl+z` change mode for screen cmd  
* `[` copy mode start  
* `h` or `j` or `k` or `l` mv cursor  
* `shift+y` copy mode end
* `y` copy and continue  
* `W` copy word  
* `]` paste  
