https://www.webdesignleaves.com/pr/plugins/mac_terminal_basics_05.html

https://scriptingosx.com/zsh/


## zsh configuration files

### order
1. .zshenv
2. .zprofile
3. .zshrc
4. .zlogin
5. .zlogout



## zsh hook

https://qiita.com/mollifier/items/558712f1a93ee07e22e2  
https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Manipulating-Hook-Functions

## zsh alias 

https://www.rasukarusan.com/entry/2019/03/04/232228

## zsh functions

https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh

```
mkdir ~/.zfuncs
```

```zshrc
fpath=( ~/.zfuncs "${fpath[@]}" )
```

`~/.zfuncs/hello`
```
# Let's again assume that these are the contents of a file called "hello".

# You may run arbitrary code in here, that will run the first time the
# function is referenced. Commonly, that is initialisation code. For example
# the `_tmux' completion function does exactly that.
echo initialising...

# You may also define additional functions in here. Note, that these
# functions are visible in global scope, so it is paramount to take
# care when you're naming these so you do not shadow existing commands or
# redefine existing functions.
hello_helper_one () {
    printf 'Hello'
}

hello_helper_two () {
    printf 'world.'
}

# Now you should redefine the "hello" function (which currently contains
# all the code from the file) to something that covers its actual
# functionality. After that, the two helper functions along with the core
# function will be defined and visible in global scope.
hello () {
    printf '%s %s\n' "$(hello_helper_one)" "$(hello_helper_two)"
}

# Finally run the redefined function with the same arguments as the current
# run. If this is left out, the functionality implemented by the newly
# defined "hello" function is not executed upon its first call. So:
hello "$@"
```

```
zsh% hello
initialising...
Hello world.
```
