# vim - tab pages commands

## Commands

#### Open a new tab page

 1. command line

```bash
vim -p filename1 filename2
```
 2. run vim already

```
:[count]tabe[dit]
:[count]tabnew
```

`count`とはすでにタブで複数のページを開いた場合カレントのタブからいくつ後に新規のタブを挿入するかという意味。 

`:3tabe newfile`だと現在のタブの３個後ろの場所に新規ファイルのタブを挿入して移動。 

