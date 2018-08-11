http://www.vimgolf.com/

## require
```console
$ sudo yum install ruby
```
## install & setup
```console
$ gem install vimgolf
Fetching: thor-0.20.0.gem (100%)
Successfully installed thor-0.20.0
Fetching: json_pure-2.1.0.gem (100%)
Successfully installed json_pure-2.1.0
Fetching: highline-2.0.0.gem (100%)
Successfully installed highline-2.0.0
Fetching: vimgolf-0.4.8.gem (100%)

------------------------------------------------------------------------------
Thank you for installing vimgolf-0.4.8.

0.1.3: custom vimgolf .vimrc file to help level the playing field
0.2.0: proxy support, custom diffs + proper vimscript parser/scoring
0.3.0: improve windows support, switch to YAML to remove c-ext dependency
0.4.0: improved diff/retry CLI, emacs support: http://bit.ly/yHgOPF

*NOTE*: please re-run "vimgolf setup" prior to playing!

For more information, rules & updates: http://vimgolf.com/about
------------------------------------------------------------------------------
Successfully installed vimgolf-0.4.8
Parsing documentation for thor-0.20.0
Installing ri documentation for thor-0.20.0
Parsing documentation for json_pure-2.1.0
Installing ri documentation for json_pure-2.1.0
Parsing documentation for highline-2.0.0
Installing ri documentation for highline-2.0.0
Parsing documentation for vimgolf-0.4.8
Installing ri documentation for vimgolf-0.4.8
4 gems installed
```

```console
$ vimgolf setup

Let's setup your VimGolf key...
1) Open vimgolf.com in your browser.
2) Click "Sign in with Twitter".
3) Once signed in, copy your key (black box, top right).

Paste your VimGolf key: xxxxxxxxxxxxxxxx
Saved. Happy golfing!
```


## challenge
```console
$ vimgolf put [challenge ID]
```
