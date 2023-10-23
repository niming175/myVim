" NERDTree 目录树插件配置

map <LEADER>b :NERDTreeToggle<CR>

" 打开 当前文件所在目录树
map <LEADER>n :NERDTreeFind<CR> 

" 打开vim， 不带文件参数的时候，展开目录树
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" 当是最后界面被关掉时，目录树若还是处于打开状态，则关闭
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" 当我切换到其他tab时，自动配置相同的目录树
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" 状态图标
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


let g:NERDTreeGitStatusUntrackedFilesMode = 'normal'

let g:NERDTreeGitStatusUseNerdFonts = 1

" 隐藏中括号
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0




