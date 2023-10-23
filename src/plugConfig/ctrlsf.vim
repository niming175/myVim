" 全局搜索
" https://github.com/dyng/ctrlsf.vim

nmap <leader>F <Plug>CtrlSFPrompt
vmap <leader>F <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordPath

" 搜索类型 compact 紧凑 | normal 自然
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_search_mode = 'async'
" 结果位置, 搜索类型compact 时有效
let g:ctrlsf_position = 'left_local'
" 搜索位置
let g:ctrlsf_compact_position = 'bottom_outside'

" 打开文件后，是否关闭CtrlSF
let g:ctrlsf_auto_close = {
    \"normal" : 0,
    \"compact": 1
    \}

" 聚焦
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

let g:ctrlsf_auto_preview = 1

" 过滤掉文件夹
let g:ctrlsf_ignore_dir = ['bower_components', 'vendor', 'runtime', 'node_module', 'dist', 'assets']

" 是否可预览
let g:ctrlsf_auto_preview = 1

