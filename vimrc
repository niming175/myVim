" 领导键
let mapleader=' '

" 配置文件基本路径
if has('nvim')
  let configPath = expand('~/.config/nvim/')
else
  let configPath = expand('~/.vim/')
endif

" 函数，加载文件
function! SourceFIle(filename)
  " 加载
  execute 'source' . g:configPath . a:filename
endfunction

" 插件
" call plug#begin()
call plug#begin(configPath . 'plugged')
  call SourceFIle('src/PlugIn.vim')
call plug#end()

" 基本配置
call SourceFIle('src/base.vim')

" 主题颜色
call SourceFIle('src/theme.vim')

" 操作配置，如快捷绑定
call SourceFIle('src/operation.vim')

" vim 字体图标配置
call SourceFIle('src/plugConfig/webdevicons.vim')

" airline 配置
call SourceFIle('src/plugConfig/airline.vim')

" nerdtree 目录树配置
call SourceFIle('src/plugConfig/nerdtree.vim')

" markdown preview
call SourceFIle('src/plugConfig/markdown_preview.vim')

" emmet
call SourceFIle('src/plugConfig/emmet.vim')

" vim prettier 格式化
call SourceFIle('src/plugConfig/vim_prettier.vim')

" ctrlsf 全局关键搜索
call SourceFIle('src/plugConfig/ctrlsf.vim')

" fzf 搜索
call SourceFIle('src/plugConfig/FzfConfig.vim')

" fzf_mru 最近常打开文件
" let g:fzf_mru_file_list_size = 10
" let g:fzf_mru_ignore_patterns = 'fugitive\|\.git/\|\_^/tmp/'

let g:phpcd_php_cli_executable = 'php7.4'

" 缩进线indentline 插件设置
call SourceFIle('src/plugConfig/indent_line.vim')

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
      \ 'coc-jest',
      \ 'coc-blade',
      \ '@yaegassy/coc-tailwindcss3'
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

if (has('nvim'))
  " gitleng 插件 nvim 独占
  source ~/.config/nvim/src/plugConfig/blamer.vim
endif


" Copilot
" 自定义 Copilot 快捷键

" 设置 Tab 接受提示
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" 接受补全提示的单词
imap <C-Right> <Plug>(copilot-accept-word)

" 设置切换建议快捷键
imap <silent><script><expr> <C-n> copilot#Next()
imap <silent><script><expr> <C-p> copilot#Previous()

