" https://github.com/junegunn/fzf.vim
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
nmap <C-P> :Files<CR>

" 预览窗口，ctrl + ‘-’ 开启或关闭预
let g:fzf_preview_window = ['right,60%,<70(up,40%)', 'ctrl-/']

" 打开文件的方式
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-j': 'split',
  \ 'ctrl-l': 'vsplit' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" 过滤掉不必要的文件夹
let $FZF_DEFAULT_COMMAND='find . \( -name .git -o -name .idea -o -name .vscode -o -name .sass-cache -o -name node_modules -o -name build -o -name public \) -prune -o -print'

" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'

if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
endif


" 打开 fzf 的方式选择 floating window 仅在最新版本（0.4以上版本）的nvim支持
" let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

" 窗口浮动函数
function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Chenfa')

  setlocal
        \ buftype=nofile
        \ bufhidden=hide
        \ nobuflisted
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

