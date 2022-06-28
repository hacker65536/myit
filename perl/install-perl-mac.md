```
❯ perl -e 'print $^V'
v5.34.0
```



```
brew install plenv
```

```
❯ plenv install -l | sort -V| tail
 5.35.7
 5.35.8
 5.35.9
 5.35.10
 5.35.11
 5.36.0
 5.36.0-RC2
 5.36.0-RC3
 5.37.0
 5.37.1
```

```
❯ plenv install 5.36.0
```

```
❯ plenv global 5.36.0
```

```
❯ plenv versions
  system
* 5.36.0 (set by /Users/USERNAME/.plenv/version)
```

```
echo 'export PATH=~/.plenv/bin:~/.plenv/shims/:$PATH' >>  ~/.zshrc
echo 'eval "$(plenv init - zsh)"' >> ~/.zshrc
```


```
❯ exec $SHELL --login
```

```
❯ perl -e 'print $^V'
v5.36.0
```


