
```
#!/bin/bash

echo aaa
echo !$
```

this dont work

```
#!/bin/bash

set -o history
set -o histexpand
echo aaa
echo !$
```
this is work well
