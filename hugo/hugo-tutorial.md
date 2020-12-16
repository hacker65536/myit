# hugo

https://gohugo.io/getting-started/quick-start/

install
--

```console
$ brew install hugo
```
```console
$ hugo version

Hugo Static Site Generator v0.79.0/extended linux/amd64 BuildDate: unknown
```

quickstart
--

```console
$ hugo new site quickstart
```

```console
$ cd quickstart

$ git init
$ git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
```

```console
$ echo 'theme = "ananke"' >> config.toml
```


```console
$ hugo new posts/my-first-post.md
```


```console
$ git submodule update --init --recursive
```

```console
$ hugo -D
```

```console
$ hugo server -D
```

access to localhost:1313
