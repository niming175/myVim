" markdown 插件
" https://github.com/iamcco/markdown-preview.nvim

" 主题色
let g:mkdp_theme = 'light'

autocmd Filetype markdown map <LEADER>m :MarkdownPreview <CR>

" 禁用markdown代码框符号的隐藏
let g:vim_markdown_conceal_code_blocks = 0

" 禁用符号隐藏
let g:vim_markdown_conceal = 0

let g:mkdp_open_to_the_world = 1
" makrdown预览插件，默认开启端口
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_port = '8081'

let g:mkdp_filetypes = ['markdown']

let g:mkdp_page_title = '预览-${name}'

let g:mkdp_preview_options = {
    \ 'content_editable': v:false,
    \ }

