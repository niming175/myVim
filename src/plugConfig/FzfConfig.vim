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
let $FZF_DEFAULT_COMMAND='find . \( -name .git -o -name .idea -o -name .vscode -o -name .sass-cache -o -name node_modules -o -name public \) -prune -o -print'

" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'

if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

