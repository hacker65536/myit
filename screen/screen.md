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

defscrollback 4000 

#scrollback 4000 using current screent
```

`defscrollback 4000 `を設定し puttyの設定で  
端末 > 高度な設定 > Alternate 端末画面への切り替えを無効にする(W)  
これでマウスによるスクロールが可能になる。

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


##edit window name

C-z A

##jump

C-z [0-9]


##troubleshooting
```bash
$ screen
Cannot open your terminal '/dev/pts/1' - please check.
```

run command with login user
