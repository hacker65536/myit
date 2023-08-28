
## ERR_UNKNOWN_FILE_EXTENSION
error
```
TypeError [ERR_UNKNOWN_FILE_EXTENSION]: Unknown file extension ".ts" for /path
```
solution

`tsconfig.json`
```tsconfig
"ts-node": {
    "esm": true,
    "experimentalSpecifierResolution": "node"
  },
```
