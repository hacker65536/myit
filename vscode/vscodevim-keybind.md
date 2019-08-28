
keybindings for select suggestion (vscodevim)

up `ctrl+p` down `ctrl+n`


command palette [ open keyboard shortcut(JSON) ]


```json
// Place your key bindings in this file to override the defaults
[
    {
        "key": "ctrl+k",
        "command": "acceptSelectedSuggestion"
    },
    {
        "key": "ctrl+n",
        "command": "selectNextSuggestion",
        "when": "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible"
    },
    {
        "key": "ctrl+p",
        "command": "selectPrevSuggestion",
        "when": "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible"
    }
]
```


https://naoki-otsu.com/2018-04-14-vscodevim-keybindings/
