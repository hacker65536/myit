# terminalizer
https://github.com/faressoft/terminalizer


install
--

```console
$ npm install -g terminalizer
```

```console
$ terminalizer init
The global config directory is created at
/Users/myaccount/.terminalizer
```

usage
--

record
```console
$ terminalizer record demo
The recording session is started
Press CTRL+D to exit and save the recording
```

`CTRL+D`
```console
$ logout
Successfully Recorded
The recording data is saved into the file:
/Users/myaccount/demo.yml
You can edit the file and even change the configurations.
The command `terminalizer share`can be used anytime to share recordings!
? Would you like to share your recording on terminalizer.com? (Y/n)
```
-k skip-share

```console 
$ terminalizer render demo
Rendering frame 2/2 100% [==============================] 0.0s
Merging frame 2/2 100% [==============================] 0.0s

Successfully Rendered
The animated GIF image is saved into the file:
/Users/myaccount/render1587574791824.gif
```
-o filename


config
--

```yaml
fontFamily: "DejaVu Sans Mono for Powerline, Monaco, Lucida Console, Ubuntu Mono, Monospace"
```
