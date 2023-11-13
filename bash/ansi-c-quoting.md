https://www.gnu.org/software/bash/manual/html_node/ANSI_002dC-Quoting.html


>Character sequences of the form $’string’ are treated as a special kind of single quotes. The sequence expands to string, with backslash-escaped characters in string replaced as specified by the ANSI C standard. Backslash escape sequences, if present, are decoded as follows:

```bash
 echo $'aaa\'aaa'
aaa'aaa
````
