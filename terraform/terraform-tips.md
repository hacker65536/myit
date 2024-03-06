
# move state

```console
$ cat resources |head -1 | xargs -I{} -d '\n' bash -c $'terraform state mv -state-out=export.tfstate -state=tmp.tfstate -backup=back -backup-out=backout \'{}\' \'{}\''     
Move "aws_ssoadmin_account_assignment.all_billings[\"123456789012\"]" to "aws_ssoadmin_account_assignment.all_billings[\"123456789012\"]"
Successfully moved 1 object(s).
```
