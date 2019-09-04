
keyboard shortcuts for windows
--
https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf

### quick open
- `Ctrl+P`

### command palette
- `Ctrl+Shift+P`

### markdown preview
- new pane `Ctrl+K V`
- new tab `Ctrl+Shift+V`



"Visual Studio Code is unable to watch for file changes in this large workspace" 
--

https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc


```console
$ cat /proc/sys/fs/inotify/max_user_watches
8192
```

```console
$ sudo vim /etc/sysctl.conf
```
add below line
```
fs.inotify.max_user_watches=524288
```

load
```console
sudo sysctl -p
```
