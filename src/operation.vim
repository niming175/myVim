" 操作配置

" 鼠标操作
set mouse=a

" 鼠标选择
if has( 'mouse' )
  set mouse-=a
endif

" 文本缩进
" nmap <tab> V>
" nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" 行移动
nnoremap <M-up> :m .-2<CR>==
nnoremap <M-down> :m .+1<CR>==
inoremap <M-up> <Esc>:m .-2<CR>==gi
inoremap <M-down> <Esc>:m .+1<CR>==gi
vnoremap <M-up> :m '<-2<CR>gv=gv
vnoremap <M-down> :m '>+1<CR>gv=gv

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
" map <LEADER><right> :vertical resize-3<CR>
" map <LEADER><left> :vertical resize+3<CR>

" 设置tab
map <LEADER>t :tabe<CR>
map <LEADER>- :-tabnext<CR>
map <LEADER>= :+tabnext<CR>
nnoremap <LEADER><Tab> <C-^>

" 复制到剪贴板
" nmap <c-v> "+gp
" vmap <c-c> "+y

" 保存快捷键
inoremap <C-S> <Esc>:w<CR>li
nnoremap <C-S> :w<CR>
" inoremap <C-Z> <Esc>uli

" 删除， d为删除，x为剪切
nnoremap d "_d
vnoremap d "_d

" 刷新配置
map R :source $MYVIMRC<CR>
" 大写S对应保存
map S :w<CR>
" 大写Q对应退出
map Q :q<CR>

" 缓冲区切换
map <leader><Right> :bnext<CR>
map <leader><Left> :bprevious<CR>

" 删除缓冲区
nnoremap <Leader>w :bd<CR>

" 格式化选中区域
vmap <leader>f  <Plug>(coc-format-selected) 
xmap <leader>f  <Plug>(coc-format-selected)
" 格式化整个文件
nmap <leader>f  <Plug>(coc-format)

" Neovim 0.11+: 自动识别并使 coc.nvim 继承项目 .vscode/settings.json
if has('nvim')
lua << EOF
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local root = vim.fs.root(0, { ".vscode", ".git" })
    if not root then return end
    local vscode_settings = root .. "/.vscode/settings.json"
    local vim_dir = root .. "/.vim"
    local coc_settings = vim_dir .. "/coc-settings.json"

    if vim.uv.fs_stat(vscode_settings) and not vim.uv.fs_stat(coc_settings) then
      vim.fn.mkdir(vim_dir, "p")
      vim.uv.fs_symlink("../.vscode/settings.json", coc_settings)
    end
  end
})
EOF
endif


