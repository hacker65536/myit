https://github.com/justmao945/vim-clang


```bash
sudo yum install clang
cd ~/.vim/bundle; git clone https://github.com/justmao945/vim-clang.git

cat <<'EOF' >> ~/.vimrc
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ –pedantic-errors'
let g:clang_format_auto = 1
let g:clang_format_style = 'Google'
let g:clang_check_syntax_auto = 1
EOF
```

