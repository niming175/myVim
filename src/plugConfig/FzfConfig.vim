" https://github.com/junegunn/fzf.vim
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
nmap <C-P> :Files<CR>

" 预览窗口，ctrl + ‘-’ 开启或关闭预
let g:fzf_preview_window = ['right,60%,<70(up,40%)', 'ctrl-/']

" 预览窗口代码高亮主题（适配 monokai 主题）与样式
let $BAT_THEME = 'Monokai Extended'
let $BAT_STYLE = 'numbers,changes'

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

" 过滤掉不必要的文件夹及编译打包产物（遵循 .gitignore，但放行 .env 配置文件）
if executable('rg')
  let $FZF_DEFAULT_COMMAND = "sh -c '(rg --files --hidden " .
    \ "--glob \"!.git/*\" " .
    \ "--glob \"!node_modules/*\" " .
    \ "--glob \"!dist/*\" " .
    \ "--glob \"!build/*\" " .
    \ "--glob \"!out/*\" " .
    \ "--glob \"!.output/*\" " .
    \ "--glob \"!.next/*\" " .
    \ "--glob \"!.nuxt/*\" " .
    \ "--glob \"!coverage/*\" " .
    \ "--glob \"!.cache/*\" " .
    \ "--glob \"!.sass-cache/*\" " .
    \ "--glob \"!.idea/*\" " .
    \ "--glob \"!.vscode/*\" " .
    \ "--glob \"!public/*\" " .
    \ "--glob \"!*.min.js\" " .
    \ "--glob \"!*.min.css\" " .
    \ "--glob \"!*.map\" " .
    \ "--glob \"!*.chunk.js\" " .
    \ "--glob \"!*.bundle.js\"; " .
    \ "rg --files --hidden --no-ignore-vcs --glob \"**/.env*\" --glob \"!node_modules/*\" --glob \"!.git/*\" 2>/dev/null || true) | sort -u'"
else
  let $FZF_DEFAULT_COMMAND='find . \( -name .git -o -name .idea -o -name .vscode -o -name .sass-cache -o -name node_modules -o -name dist -o -name build -o -name out -o -name .output -o -name .next -o -name .nuxt -o -name coverage -o -name public \) -prune -o -type f \( ! -name "*.min.js" ! -name "*.min.css" ! -name "*.map" ! -name "*.chunk.js" ! -name "*.bundle.js" \) -print'
endif

" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'

if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

