" 领导键
let mapleader=' '

set helplang=cn
set encoding=utf-8
set t_Co=256

set nocompatible
set cursorline " 光标线
set showcmd

" 搜索
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" 搜搜用- = 键来切换上下文
noremap = nzz
noremap - Nzz

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
set autoindent  " 设置为自动缩进
set expandtab

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
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

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

Plug 'Valloric/YouCompleteMe'

" 文本对齐插件
Plug 'godlygeek/tabular'
" markdown 插件
Plug 'plasticboy/vim-markdown'
" tab对齐线
Plug 'Yggdroot/indentLine'

" php补全插件。ycm对php补全并不友好
" Plug 'phpvim/phpcd.vim', { 'for': 'php' }
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" Plug 'vim-scripts/progressbar-widget' " 用来显示索引进度的插件
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" nginx高亮支持
Plug 'chr4/nginx.vim'

call plug#end()

let g:airline_theme='light'
" 主题
color monokai
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
let g:jsx_ext_required = 0

" markdown 插件
autocmd Filetype markdown map <LEADER>m :MarkdownPreview <CR>
" 禁用markdown代码框符号的隐藏
let g:vim_markdown_conceal_code_blocks = 0
" 禁用符号隐藏
let g:vim_markdown_conceal = 0

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
nnoremap <Leader>f :Ack<space>-i<space>

" fzf 搜索
nmap <C-P> :Files<CR>

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
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

" you complete me
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = "/usr/bin/python3"
let g:ycm_python_binary_path = "/usr/bin/python3"

" phpcd 这对php的补全插件
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
" autocmd FileType php set omnifunc=phpcomplete
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('ignore_sources', {'php': ['phpcd', 'omni']})

let g:phpcd_php_cli_executable = 'php7.3'

" emmet 插件
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,vue,jsx EmmetInstall

" 缩进线indentline 插件设置
let g:indentLine_color_term = 243
let g:indentLine_char = '┊'

" 设置json时不显示缩进线
autocmd FileType json,markdown let g:indentLine_conceallevel=0
autocmd FileType javascript,python,c,cpp,java,vim,shell let g:indentLine_conceallevel=2
