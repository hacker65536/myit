
```bash
#!/bin/bash

echo aaa
echo !$
```

```
bash -x script
+ echo aaa
aaa
+ echo '!$'
!$
```

this dont work

```bash
#!/bin/bash

set -o history
set -o histexpand
# or set -H
echo aaa
echo !$
```
```
bash -x script
 set -o history
+ set -o histexpand
+ echo aaa
aaa
echo aaa
+ echo aaa
aaa
```
this works well
