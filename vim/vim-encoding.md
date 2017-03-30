## `encoding` `enc`

現在の文字エンコーディングを確認する
```vim
:se enc?
```
or
```vim
:set encoding?
```
```vim
encoding=utf-8
```
設定する
```vim
:se enc=cp932
```
```vim
:se enc?
```
```vim
encoding=cp932  
```


>NOTE: このオプションの値を変更しても、Vim内部の既存のテキストのエンコー
        ディングは変化しないので注意。非ASCII文字がおかしくなる恐れもある。既
        定の値から変更しないか、Vimの起動時に限って設定すること。



## encoding-names

設定できる文字コード一覧
http://vim-jp.org/vimdoc-ja/mbyte.html#encoding-names


```
2   cp932       日本語 (Windows only)
2   euc-jp      日本語 (Unix only)
2   sjis        日本語 (Unix only)
```

alias
```
1   ansi        latin1と同じ (廃止。後方互換性のために残されている)
2   japan       日本語: Unixではeuc-jp、MS-Windowsではcp932
2   korea       韓国語: Unixではeuc-kr、MS-Windowsではcp949
2   prc         簡体中国語: Unixではeuc-cn、MS-Windowsではcp936
2   chinese     prcと同じ
2   taiwan      繁体中国語: Unixではeuc-tw、MS-Windowsではcp950
u   utf8        utf-8と同じ
u   unicode     ucs-2と同じ
u   ucs2be      ucs-2と同じ (ビッグエンディアン)
u   ucs-2be     ucs-2と同じ (ビッグエンディアン)
u   ucs-4be     ucs-4と同じ (ビッグエンディアン)
u   utf-32      ucs-4と同じ
u   utf-32le    ucs-4leと同じ
    default     'encoding' のデフォルト値を意味する。環境に依存する。
```

