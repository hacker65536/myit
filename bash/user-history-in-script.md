
```bash
#!/bin/bash

echo aaa
echo !$
```

this dont work

```bash
#!/bin/bash

set -o history
set -o histexpand
echo aaa
echo !$
```
this works well
