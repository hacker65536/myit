```shell
function awsp(){
 $(cat ~/.aws/config| grep "\[profile" | sed -r -e 's/\[profile (.*)\]/\1/' | fzf | xargs -I{} bash -c "echo export AWS_PROFILE={}")
}
```
