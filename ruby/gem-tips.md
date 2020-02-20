

## permission
```console
$ gem install bundler
ERROR:  While executing gem ... (Gem::FilePermissionError)
    You don't have write permissions for the /Library/Ruby/Gems/2.3.0 directory.
```


don't user system version, instead of rbenv


### ref
https://qiita.com/nishina555/items/63ebd4a508a09c481150

## gemfile (private repo with oauth token)
```console
$ export BUNDLE_GITHUB__COM=[github token]:x-oauth-basic
```

### ref
https://qiita.com/nysalor/items/bcc07679f207b0e6e7a5
