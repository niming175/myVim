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

set tabstop=2 " tab键
set shiftwidth=2 " 设置两个空格宽度
set softtabstop=2
set expandtab

filetype on
filetype plugin on " 允许加载文件类型插件
filetype indent on " 允许vim为不同类型的文件定义不同的缩进格式

au FileType php setlocal tabstop=4 " php 为4个缩进
au FileType php setlocal shiftwidth=4
au FileType php setlocal softtabstop=4

set autoindent  " 设置为自动缩进
set smartindent  " 设置只能缩进
set cindent     " c语言自动缩进
" set noautoindent " 禁用自动缩进
" set nosmartindent " 禁用智能缩进

syntax on " 自动语法高亮

let &t_ut=''

set number

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

