

To using `ctrl+p` and `ctrl+n` to go to a previous, next command in integrate terminal on vscode
--


Open the Command Palette `ctrl+shift+p`

select or type `Open Settings(JSON)`


add the folowing code
```jsonnet
{
    //....
    "terminal.integrated.commandsToSkipShell": [
        "-workbench.action.quickOpen",
    ]
}
```




https://qiita.com/Enola/items/225ff3d0ed7b3c2ee2d6

https://qiita.com/m_zuma/items/06d989b0c60f7f2e9301

https://github.com/Microsoft/vscode/issues/34030


change font
--

```json
"terminal.integrated.fontFamily": "DejaVu Sans Mono for Powerline"
```
