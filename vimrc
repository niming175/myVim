" 领导键
let mapleader=' '

" 基本配置
source ~/.config/nvim/src/base.vim

" 插件
" call plug#begin()
call plug#begin('~/.vim/plugged')
source ~/.config/nvim/src/PlugIn.vim
call plug#end()

" airline 配置
source ~/.config/nvim/src/plugConfig/airline.vim

" 主题
color monokai

" 设置提示窗口主题
hi Pmenu ctermfg=249 ctermbg=239 cterm=NONE guifg=NONE guibg=NONE gui=NONE
" 注释颜色
hi Comment ctermfg=249

let g:SnazzyTransparent = 1

" 鼠标操作
set mouse=a

" 鼠标选择
if has( 'mouse' )
  set mouse-=a
endif


" 行移动
nnoremap <M-up> :m .-2<CR>==
nnoremap <M-down> :m .+1<CR>==
inoremap <M-up> <Esc>:m .-2<CR>==gi
inoremap <M-down> <Esc>:m .+1<CR>==gi
vnoremap <M-up> :m '<-2<CR>gv=gv
vnoremap <M-down> :m '>+1<CR>gv=gv

" 保存快捷键
inoremap <C-S> <Esc>:w<CR>li
nnoremap <C-S> :w<CR>
inoremap <C-Z> <Esc>uli

" 跳到单词前后
map <C-LEFT> b
map <C-RIGHT> w

" 分屏
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

" 切换分屏
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j

" 改变分屏大小
map <LEADER><up> :res +3<CR>
map <LEADER><down> :res -3<CR>
map <LEADER><right> :vertical resize-3<CR>
map <LEADER><left> :vertical resize+3<CR>

" 设置tab
map <LEADER>t :tabe<CR>
map <LEADER>- :-tabnext<CR>
map <LEADER>= :+tabnext<CR>

" 复制到剪贴板
" nmap <c-v> "+gp
" vmap <c-c> "+y

" 刷新配置
map R :source $MYVIMRC<CR>
" 大写S对应保存
map S :w<CR>
" 大写Q对应退出
map Q :q<CR>

" 插件快捷键

" NERDTree 目录树插件配置
map <LEADER>b :NERDTreeToggle<CR>
map <LEADER>n :NERDTreeFind<CR>

" 默认打开vim 时展开目录树，并聚焦在其他窗口
" autocmd VimEnter * NERDTree | wincmd p

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

let g:NERDTreeGitStatusUseNerdFonts = 1
" 隐藏中括号
let g:NERDTreeGitStatusConcealBrackets = 1

let g:webdevicons_enable_airline_tabline = 1

" jsx 插件支持
" let g:javascript_plugin_jsdoc=1
" let g:jsx_ext_required = 1

" markdown 插件
autocmd Filetype markdown map <LEADER>m :MarkdownPreview <CR>
" 禁用markdown代码框符号的隐藏
let g:vim_markdown_conceal_code_blocks = 0
" 禁用符号隐藏
let g:vim_markdown_conceal = 0

" ---------------------- Markdown Preview 插件 ----------------------
let g:mkdp_open_to_the_world = 1
" makrdown预览插件，默认开启端口
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_port = '8081'
" function! g:Open_browser(url)
"     silent exe '!lemonade open 'a:url
" endfunction
" let g:mkdp_browserfunc = 'g:Open_browser'

" 文件查找插件
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

" 文件查找插件查找模式
" let g:ctrlp_working_path_mode = 'ra'

" 忽略的文件
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn|rvm|vendor|node_modules)$',
"   \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
"   \ }
" fzf_mru 最近常打开文件
let g:fzf_mru_file_list_size = 10
let g:fzf_mru_ignore_patterns = 'fugitive\|\.git/\|\_^/tmp/'

" 单词搜索
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" fzf 搜索
source ~/.config/nvim/src/plugConfig/FzfConfig.vim

let g:phpcd_php_cli_executable = 'php7.3'

" emmet 插件
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,vue,jsx,javascript,php EmmetInstall
let g:user_emmet_mode='a'  " 在所有模式下开启
let g:user_emmet_leader_key='<C-E>'

" 缩进线indentline 插件设置
let g:indentLine_color_term = 243
let g:indentLine_char = '┊'

" 设置json时不显示缩进线
autocmd FileType json,markdown let g:indentLine_conceallevel=0
autocmd FileType javascript,python,c,cpp,java,vim,shell let g:indentLine_conceallevel=2

" coc 插件
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-vimlsp',
      \ 'coc-phpls',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-highlight',
      \ 'coc-vetur',
      \ 'coc-spell-checker',
      \ 'coc-git',
      \ 'coc-jest'
      \]

" 'coc-emmet',
" 'coc-prettier'
" set signcolumn=no

" 按tab补全，ycm有已经自带了这个设置，如果有开启ycm可以不设置以下
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 快捷键ctrl + 空格触发补全, vim的话，则是ctrl + @
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" 查找上下文的错误， g + [ 或 g + ]
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 查找上下文定义的函数
" nmap <silent> <C-b> :tabe<cr><Plug>(coc-definition)
" 以新页面打开定义的函数
nmap <silent> <C-b> :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 查看文档 主键 + H
nnoremap <silent> <LEADER>H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" 相同词高亮
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
" 选中代码格式化
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" 注释配置
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }}

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

nmap <C-c>   <Plug>NERDCommenterToggle
vmap <C-c>   <Plug>NERDCommenterToggle<CR>gv

" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
" set termguicolors

imap <C-x> <Esc>:wq<CR>

" xdebug调试
" let g:dbgPavimOnce = 1
" let g:dbgPavimBreakAtEntry = 1

" let g:dbgPavimPathMap = [['/Volumes/Document/www/shopifyerp/backend','/var/www/shopifyerp/backend'],] " 映射文件位置
" let g:dbgPavimPort = 9000
" let g:dbgPavimBreakAtEntry = 0

if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options.port = 9000
let g:vdebug_options.path_maps = { "/var/www": "/Volumes/Document/www" }
let g:vdebug_options.break_on_open = 0

"""""""""""""""""""" vim prettier config """""""""""""""""""""""
" 当存在@format或@prettier时自动格式化
let g:prettier#autoformat = 1

" 根据当前目录或任何父目录中找到配置文件来切换g:prettier#autoformat 设置。
" 请注意，这将覆盖 g:prettier#autoformat设置！
let g:prettier#autoformat_config_present = 1

" 格式化配置文件
" let g:prettier#autoformat_config_files = [...]

" 格式化快捷键
nmap <Leader>f <Plug>(Prettier)
"*********** coc Prettier ***************************"
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f :CocCommand prettier.formatFile <CR>

"*********** vim-visual-multi 多光标配置 *******************"
let g:VM_theme                      = 'ocean'
let g:VM_highlight_matches          = 'red'
let g:VM_maps                       = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'
let g:VM_maps['Select All']         = '<C-l>'
let g:VM_maps['Select h']           = '<S-Left>'
let g:VM_maps['Select l']           = '<S-Right>'
let g:VM_maps['Add Cursor Up']      = '<S-Up>'
let g:VM_maps['Add Cursor Down']    = '<C-Down>'
" let g:VM_maps['Add Cursor At Pos']  = '<C-x>'
" let g:VM_maps['Add Cursor At Word'] = '<C-w>'
let g:VM_maps['Remove Region']      = 'q'

"************* 彩虹括号 ***************************************"
let g:rainbow_active = 1

"************* ctrlsf 全局搜索 ********************************"
nmap <leader>F <Plug>CtrlSFPrompt
"nmap <leader>F :CtrlSFToggle<CR>
vmap <leader>F <Plug>CtrlSFVwordExec
" vmap <C-F>F <Plug>CtrlSFVwordExec
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
let g:ctrlsf_ignore_dir = ['bower_components', 'vendor', 'runtime', 'node_module', 'dist']

if (has('nvim'))
  " gitleng 插件 nvim 独占
  source ~/.config/nvim/src/plugConfig/blamer.vim
endif
