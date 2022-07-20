

## setup

```
cd ~/
git clone https://github.com/google/docsy-example.git .
```

```
cd ~/
mkdir mygitpages
```

```
cd docsy-example
git archive master| tar -x -C /Users/myname/mygitpages
```


edit config.toml
```toml
baseURL = "http://localhost"

# Language settings
contentDir = "content/ja"
defaultContentLanguage = "ja"



[languages]
[languages.ja]
title = "Goldydocs"
description = "A Docsy example site"
languageName ="Japanese"
# Weight used for sorting.
weight = 1
[languages.en]
title = "Goldydocs"
description = "A Docsy example site"
languageName ="English"
contentDir = "content/en"
```
