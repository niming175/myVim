" https://github.com/prettier/vim-prettier

" 格式化快捷键
nmap <Leader>f <Plug>(Prettier)

" 当存在@format或@prettier时自动格式化
let g:prettier#autoformat = 1

" 根据当前目录或任何父目录中找到配置文件来切换g:prettier#autoformat 设置。
" 请注意，这将覆盖 g:prettier#autoformat设置！
let g:prettier#autoformat_config_present = 1

" 格式化配置文件
" let g:prettier#autoformat_config_files = [...]

au FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"


