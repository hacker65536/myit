https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html


${parameter:-word}
--

If parameter is unset or null, the expansion of word is substituted . Otherwise, the value of parameter is substituted.
```bash
#!/bin/env bash
echo ${parameter:-word}
```
```console
$ sh param.sh
word
```

```bash
#!/bin/env bash
parameter=someword
echo ${parameter:-word}
```
```console
$ sh param.sh
someword
```

${parameter:=word}
--

If parameter is unset or null, the expansion of word is assigned to parameter. The value of parameter is then substituted. Positional parameters and special parameters may not be assigned to in this way.

```bash
#!/bin/env bash
echo ${parameter:=word}
echo ${parameter}
```

```console
$ sh param.sh
word
word
```


```bash
#!/bin/env bash
echo ${parameter:-word}
echo ${parameter}
```
```console
$ sh param.sh
word

```
