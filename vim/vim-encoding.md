## `encoding` `enc`

現在の文字エンコーディングを確認する
```vim
:se enc?
```
or
```vim
:set encoding?
```
```
encoding=utf-8
```

>NOTE: このオプションの値を変更しても、Vim内部の既存のテキストのエンコー
        ディングは変化しないので注意。非ASCII文字がおかしくなる恐れもある。既
        定の値から変更しないか、Vimの起動時に限って設定すること。



