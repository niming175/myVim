Plug 'vim-airline/vim-airline'  " 导航条插件
Plug 'vim-airline/vim-airline-themes' " 导航条配套主题

" 目录树
Plug 'preservim/nerdtree' | 
  \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons' " vim 图标

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 最近常打开文件
Plug 'lvht/fzf-mru'

" 打开会话，会有头牛
Plug 'mhinz/vim-startify'

" 搜索
" Plug 'mileszs/ack.vim'

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
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" 多光标选择插件
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" 🌈括号
Plug 'luochen1990/rainbow'

" tagbar 函数树
Plug 'majutsushi/tagbar'

" 全局搜搜
Plug 'dyng/ctrlsf.vim'

" gitlens
Plug 'APZelos/blamer.nvim'

