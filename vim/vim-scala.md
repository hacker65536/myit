https://github.com/derekwyatt/vim-scala

```
mkdir -p ~/.vim/{ftdetect,indent,syntax} && \
for d in ftdetect indent syntax ; do curl -o ~/.vim/$d/scala.vim https://raw.githubusercontent.com/derekwyatt/vim-scala/master/$d/scala.vim; done
```
