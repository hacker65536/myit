
http://vim-jp.org/vimdoc-ja/message.html


 E297: Write error in swap file
----------------

http://vim-jp.org/vimdoc-ja/message.html#E297

>これはたいていディスクが一杯のときに起こる。Vimがswap-fileにテキストを書き込
むことができなかった。直接的には有害ではないが、Vimが不意に終了したとき、テキ
ストが失われ、復活の可能性もなくなってしまうかもしれない。この問題が持続する場
合は、Vimがメモリを使い果たしているのかもしれない。


これがでたらディスクがいっぱいになっているか確認する。

E303: Unable to open swap file for "{filename}", recovery impossible
---------------

http://vim-jp.org/vimdoc-ja/message.html#E303

>Vimがスワップファイルを作成できなかった。ファイルを編集することはできるが、
もしVimが不意に終了したら、変更は失われる。また、巨大なファイルを編集するとき
はメモリを多く消費するかもしれない。このエラーを回避するために 'directory' オ
プションを変更するとよいかもしれない。swap-fileを参照。


E297と一緒にでたらディスクがいっぱいになっているか確認する。
