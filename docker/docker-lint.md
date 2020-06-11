# docker lint

https://github.com/hadolint/hadolint



install
--

```
$ docker pull hadolint/hadolint
```


configuire
--

`~/.config/hadolint.yaml` or `$PWD/.hadolint.yaml`
```yaml
ignored:
  - DL3000
  - SC1010

trustedRegistries:
  - docker.io
  - my-company.com:5000
```


lint
--
```
$ docker run --rm -i hadolint/hadolint < Dockerfile
```
