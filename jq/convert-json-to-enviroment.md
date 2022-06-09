
```
❯ for s in $(echo '{"abc": "ddd"}' | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do
    export  $s
done
```
