ERROR
```
requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance
```



SOLUTION
```
❯ xcode-select -p
/Applications/Xcode.app/Contents/Developer
```


xcode -> Preferences -> Locations -> Command Line Tools -> SELECT XCODE VERSION

or

```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```
