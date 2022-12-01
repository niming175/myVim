" 领导键
let mapleader=' '

set helplang=cn
set encoding=utf-8
set t_Co=256

set nocompatible
set cursorline " 光标线
set showcmd

" set cindent " 换行缩进
" set si

" 搜索
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set updatetime=100

" Don't pass message to | ins-completion-memu
set shortmess+=c

" 显示最后一行状态
set ruler

" 搜搜用- = 键来切换上下文
nmap = nzz
nmap - Nzz

" 取消高亮
noremap <LEADER><CR> :nohlsearch<CR>

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

syntax on " 自动语法高亮

let &t_ut=''

set number

set tabstop=2 " tab键
set shiftwidth=2 " 设置两个空格宽度
set softtabstop=2

au FileType php setlocal tabstop=4 " php 为4个缩进
au FileType php setlocal shiftwidth=4
au FileType php setlocal softtabstop=4
" set autoindent  " 设置为自动缩进
set expandtab

" 文本缩进
" nmap <tab> V>
" nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" 显示不可见字符
set list
set listchars=tab:▸\ ,trail:▫

" 距离行尾还有5行
set scrolloff=5

" 不自动换行
set tw=0

" 设置删除
set backspace=indent,eol,start

" 代码折叠
set foldmethod=indent
set foldlevel=99

" 光标样式, 部分终端不一定起作用
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 显示最后一个窗口的状态行
set laststatus=2

" 切换到当前文件所在目录
" set autochdir

" 打开文件后恢复关闭前所在的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 插件
" call plug#begin()
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sickill/vim-monokai'
Plug 'connorholyday/vim-snazzy'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
"
Plug 'maxmellon/vim-jsx-pretty'

" html 补全
Plug 'mattn/emmet-vim'

" php 支持
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for' :['markdown', 'vim-plug'] }
" Plug 'kien/ctrlp.vim' " crtlP的速度会慢点
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" 最近常打开文件
Plug 'lvht/fzf-mru'

" 打开会话，会有头牛
Plug 'mhinz/vim-startify'

" 搜索
Plug 'mileszs/ack.vim'

" 文本对齐插件
Plug 'godlygeek/tabular'
" markdown 插件
Plug 'plasticboy/vim-markdown'
" tab对齐线
Plug 'Yggdroot/indentLine'

" php补全插件。ycm对php补全并不友好
" Plug 'phpvim/phpcd.vim', { 'for': 'php' }
" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" Plug 'vim-scripts/progressbar-widget' " 用来显示索引进度的插件
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" nginx高亮支持
Plug 'chr4/nginx.vim'

" coc插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 模糊搜索
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" 注释插件
Plug 'preservim/nerdcommenter'

" xdebug调试
" Plug 'brookhong/dbgpavim'
Plug 'vim-vdebug/vdebug'

" 格式化插件
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

" 多光标选择插件
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" 🌈括号
Plug 'luochen1990/rainbow'

" tagbar 函数树
Plug 'majutsushi/tagbar'

call plug#end()

let g:airline_theme='light'

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
nmap <c-v> "+gp
nmap <c-c> "+y

" 刷新配置
map R :source $MYVIMRC<CR>
" 大写S对应保存
map S :w<CR>
" 大写Q对应退出
map Q :q<CR>

" 插件快捷键
map <LEADER>n :NERDTreeToggle<CR>

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

" cnoreabbrev Ack Ack!
" nnoremap <Leader>f :Ack<space>-i<space>

" fzf 搜索
nmap <C-P> :Files<CR>

" 过滤掉不必要的文件夹
let $FZF_DEFAULT_COMMAND='find . \( -name .git -o -name .idea -o -name .vscode -o -name .sass-cache -o -name node_modules -o -name build -o -name public \) -prune -o -print'

" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" 打开 fzf 的方式选择 floating window 仅在最新版本（0.4以上版本）的nvim支持
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

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
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ bufhidden=hide
        \ nobuflisted
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

" you complete me
" let g:ycm_autoclose_preview_window_after_completion=0
" let g:ycm_autoclose_preview_window_after_insertion=1
" let g:ycm_use_clangd = 0
" let g:ycm_python_interpreter_path = "/usr/bin/python3"
" let g:ycm_python_binary_path = "/usr/bin/python3"

" phpcd 这对php的补全插件
" autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
" autocmd FileType php set omnifunc=phpcomplete
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('ignore_sources', {'php': ['phpcd', 'omni']})

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
nmap <Leader>F <Plug>(Prettier)
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

