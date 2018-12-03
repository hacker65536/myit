
write mode
```go
// If modifying these scopes, delete your previously saved token.json.
//config, err := google.ConfigFromJSON(b, "https://www.googleapis.com/auth/spreadsheets.readonly")
config, err := google.ConfigFromJSON(b, "https://www.googleapis.com/auth/spreadsheets")
```

if you didn't remove token.json when you changed scopes, you will have an error like this.
```
2018/12/03 03:57:50 googleapi: Error 403: Request had insufficient authentication scopes., forbidden
```
