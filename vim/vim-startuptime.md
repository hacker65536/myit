
```console
$ vim packages/@aws-cdk/aws-ec2/lib/machine-image.ts --startuptime vimtime
```


```console
$ cat vimtime
```

```
times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.004  000.004: --- VIM STARTING ---
000.086  000.082: Allocated generic buffers
000.147  000.061: locale set
000.151  000.004: window checked
000.443  000.292: inits 1
000.507  000.064: parsing arguments
000.508  000.001: expanding arguments
000.526  000.018: shell init
000.764  000.238: Termcap init
000.776  000.012: inits 2
000.865  000.089: init highlight
001.070  000.025  000.025: sourcing /usr/local/share/vim/vim81/ftoff.vim
001.290  000.168  000.168: sourcing /home/ec2-user/.vim/bundle/Vundle.vim/autoload/vundle.vim
001.459  000.115  000.115: sourcing /home/ec2-user/.vim/bundle/Vundle.vim/autoload/vundle/config.vim
007.828  000.012  000.012: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/css.vim
007.858  000.016  000.016: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/graphql.vim
007.878  000.009  000.009: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/html.vim
007.901  000.012  000.012: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/javascript.vim
007.920  000.008  000.008: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/json.vim
007.941  000.011  000.011: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/less.vim
007.968  000.017  000.017: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/markdown.vim
007.991  000.011  000.011: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/scss.vim
008.012  000.010  000.010: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/typescript.vim
008.031  000.009  000.009: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/vue.vim
008.052  000.011  000.011: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftdetect/yaml.vim
008.209  000.114  000.114: sourcing /home/ec2-user/.vim/bundle/vim-go/ftdetect/gofiletype.vim
008.253  000.012  000.012: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/ftdetect/typescript.vim
008.319  000.012  000.012: sourcing /usr/local/share/vim/vimfiles/ftdetect/pullrequest.vim
008.442  005.469  005.205: sourcing /usr/local/share/vim/vim81/filetype.vim
008.571  000.029  000.029: sourcing /usr/local/share/vim/vim81/ftplugin.vim
008.693  000.023  000.023: sourcing /usr/local/share/vim/vim81/indent.vim
009.517  000.610  000.610: sourcing /usr/local/share/vim/vim81/syntax/syncolor.vim
009.648  000.816  000.206: sourcing /usr/local/share/vim/vim81/syntax/synload.vim
009.670  000.914  000.098: sourcing /usr/local/share/vim/vim81/syntax/syntax.vim
009.673  008.719  001.976: sourcing $HOME/.vimrc
009.675  000.091: sourcing vimrc file(s)
009.954  000.172  000.172: sourcing /home/ec2-user/.vim/bundle/vim-prettier/plugin/prettier.vim
010.272  000.080  000.080: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/init.vim
010.582  000.081  000.081: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/parts.vim
011.419  000.108  000.108: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/util.vim
011.450  001.456  001.187: sourcing /home/ec2-user/.vim/bundle/vim-airline/plugin/airline.vim
011.521  000.013  000.013: sourcing /home/ec2-user/.vim/bundle/vim-airline-themes/plugin/airline-themes.vim
011.975  000.339  000.339: sourcing /home/ec2-user/.vim/bundle/vim-go/autoload/go/config.vim
012.603  000.316  000.316: sourcing /home/ec2-user/.vim/bundle/vim-go/autoload/go/util.vim
012.624  001.065  000.410: sourcing /home/ec2-user/.vim/bundle/vim-go/plugin/go.vim
012.807  000.125  000.125: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/plugin/tsuquyomi.vim
012.925  000.067  000.067: sourcing /home/ec2-user/.vim/bundle/vim-numbertoggle/plugin/number_toggle.vim
013.085  000.056  000.056: sourcing /home/ec2-user/.vim/bundle/deoplete.nvim/autoload/deoplete.vim
013.122  000.159  000.103: sourcing /home/ec2-user/.vim/bundle/deoplete.nvim/plugin/deoplete.vim
013.364  000.050  000.050: sourcing /usr/local/share/vim/vim81/plugin/getscriptPlugin.vim
013.515  000.136  000.136: sourcing /usr/local/share/vim/vim81/plugin/gzip.vim
013.713  000.173  000.173: sourcing /usr/local/share/vim/vim81/plugin/logiPat.vim
013.775  000.025  000.025: sourcing /usr/local/share/vim/vim81/plugin/manpager.vim
013.950  000.155  000.155: sourcing /usr/local/share/vim/vim81/plugin/matchparen.vim
014.391  000.421  000.421: sourcing /usr/local/share/vim/vim81/plugin/netrwPlugin.vim
014.443  000.012  000.012: sourcing /usr/local/share/vim/vim81/plugin/rrhelper.vim
014.484  000.020  000.020: sourcing /usr/local/share/vim/vim81/plugin/spellfile.vim
014.623  000.122  000.122: sourcing /usr/local/share/vim/vim81/plugin/tarPlugin.vim
014.713  000.064  000.064: sourcing /usr/local/share/vim/vim81/plugin/tohtml.vim
014.866  000.136  000.136: sourcing /usr/local/share/vim/vim81/plugin/vimballPlugin.vim
015.020  000.124  000.124: sourcing /usr/local/share/vim/vim81/plugin/zipPlugin.vim
015.040  000.870: loading plugins
015.080  000.040: loading packages
015.180  000.100: loading after plugins
015.184  000.004: inits 3
015.367  000.183: reading viminfo
015.374  000.007: setting raw mode
015.388  000.014: start termcap
015.406  000.018: clearing screen
016.662  000.074  000.074: sourcing /home/ec2-user/.vim/bundle/vim-prettier/ftplugin/typescript.vim
016.928  000.014  000.014: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/vital.vim
017.138  000.015  000.015: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/vital/_tsuquyomi.vim
017.461  000.267  000.267: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/vital/tsuquyomi.vim
017.702  000.098  000.098: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/vital/_tsuquyomi/ProcessManager.vim
018.256  000.347  000.347: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/vital/_tsuquyomi/Data/String.vim
018.855  000.242  000.242: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/vital/_tsuquyomi/Data/List.vim
019.366  000.118  000.118: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/vital/_tsuquyomi/Process.vim
019.839  000.241  000.241: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/vital/_tsuquyomi/Prelude.vim
020.301  000.177  000.177: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/vital/_tsuquyomi/System/Filepath.vim
020.577  003.725  002.206: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/tsuquyomi/config.vim
128.932  000.954  000.954: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/tsuquyomi.vim
129.138  000.108  000.108: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/tsuquyomi/bufManager.vim
129.664  000.107  000.107: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/vital/_tsuquyomi/Web/JSON.vim
130.315  001.091  000.984: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/autoload/tsuquyomi/tsClient.vim
315.685  298.894  293.016: sourcing /home/ec2-user/.vim/bundle/tsuquyomi/ftplugin/typescript/tsuquyomi.vim
317.104  000.512  000.512: sourcing /usr/local/share/vim/vim81/indent/typescript.vim
327.659  010.131  010.131: sourcing /usr/local/share/vim/vim81/syntax/typescript.vim
328.393  000.337  000.337: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions.vim
328.577  000.072  000.072: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/quickfix.vim
329.155  000.499  000.499: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline.vim
329.399  000.089  000.089: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/netrw.vim
329.875  000.216  000.216: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/section.vim
330.557  000.498  000.498: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/highlighter.vim
330.870  001.348  000.634: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/term.vim
331.163  000.063  000.063: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/vista.vim
331.736  000.283  000.283: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/whitespace.vim
332.323  000.159  000.159: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/po.vim
332.647  000.205  000.205: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/wordcount.vim
333.206  000.408  000.408: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/tabline.vim
333.443  000.109  000.109: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/tabline/autoshow.vim
334.068  000.266  000.266: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/tabline/tabs.vim
334.612  000.355  000.355: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/tabline/buffers.vim
335.003  000.086  000.086: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/keymap.vim
341.447  000.136  000.136: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/themes.vim
341.659  000.445  000.309: sourcing /home/ec2-user/.vim/bundle/vim-airline-themes/autoload/airline/themes/violet.vim
343.805  000.235  000.235: sourcing /home/ec2-user/.vim/bundle/vim-airline-themes/autoload/airline/themes/violet.vim
372.182  000.512  000.512: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/builder.vim
372.787  000.196  000.196: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/default.vim
399.259  068.575: opening buffers
399.309  000.050: BufEnter autocommands
399.313  000.004: editing files in windows
399.969  000.394  000.394: sourcing /home/ec2-user/.vim/bundle/deoplete.nvim/autoload/deoplete/init.vim
400.487  000.188  000.188: sourcing /home/ec2-user/.vim/bundle/deoplete.nvim/autoload/deoplete/custom.vim
400.937  000.169  000.169: sourcing /home/ec2-user/.vim/bundle/deoplete.nvim/autoload/deoplete/util.vim
401.263  000.197  000.197: sourcing /home/ec2-user/.vim/bundle/vim-hug-neovim-rpc/autoload/neovim_rpc.vim
484.832  000.046  000.046: sourcing /home/ec2-user/.vim/bundle/nvim-yarp/autoload/yarp.vim
485.455  000.498  000.498: sourcing /home/ec2-user/.vim/bundle/nvim-yarp/autoload/yarp/core.vim
485.728  000.065  000.065: sourcing /home/ec2-user/.vim/bundle/nvim-yarp/autoload/yarp/pyx.vim
721.412  000.230  000.230: sourcing /home/ec2-user/.vim/bundle/deoplete.nvim/autoload/deoplete/mapping.vim
721.895  000.288  000.288: sourcing /home/ec2-user/.vim/bundle/deoplete.nvim/autoload/deoplete/handler.vim
722.781  321.393: VimEnter autocommands
722.784  000.003: before starting main loop
723.989  000.163  000.163: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/tabline/ctrlspace.vim
724.237  000.145  000.145: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/tabline/tabws.vim
724.865  000.195  000.195: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/tabline/builder.vim
725.129  000.084  000.084: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/tabline/buflist.vim
728.840  000.073  000.073: sourcing /home/ec2-user/.vim/bundle/vim-airline/autoload/airline/extensions/tabline/formatters/default.vim
737.878  014.434: first screen update
737.880  000.002: --- VIM STARTED ---
```


TODO

research https://github.com/hyiltiz/vim-plugins-profile
