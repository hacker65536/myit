# conquer of completion

https://github.com/neoclide/coc.nvim

install
--
Vundle

`~/.vimrc`

```vim
Plugin 'neoclide/coc.nvim'
```

```vim
:source %
```
```vim
:PluginInstall
```

```console
$ cd ~/.vim/bundle/coc.nvim/
$ git checkout release
```

configure
--
`:CocConfig` or `~/.vim/coc-settings.json`

```json

      "powershell.integratedConsole.showOnStartup": false,
      "diagnostic.virtualText": true,
      "languageserver": {
      "golang": {
        "command": "go-langserver",
        "filetypes": ["go"],
        "initializationOptions": {
          "gocodeCompletionEnabled": true,
          "diagnosticsEnabled": true,
          "lintTool": "golint"
        }
      }
    },
      "languageserver": {
      "bash": {
        "command": "bash-language-server",
        "args": ["start"],
        "filetypes": ["sh"],
        "ignoredRootPaths": ["~"]
      }
    },
    "languageserver": {
      "terraform": {
        "command": "terraform-lsp",
        "filetypes": ["terraform"],
        "initializationOptions": {}
      }
    }
}
```
