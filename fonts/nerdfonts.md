# nerdfonts


https://www.nerdfonts.com/

https://www.nerdfonts.com/font-downloads


```console
$ brew tap homebrew/cask-fonts
```
```console
$ cat <<'EOF' | xargs -I{} bash -c 'brew cask install font-{}-nerd-font'
3270
DejaVuSansMono
GoMono
InconsolateGo
EOF
```
