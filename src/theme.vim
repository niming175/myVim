" 主题颜色配置

" 真彩色终端
set termguicolors

" 指定主题
color monokai

" 注释颜色
highlight Comment     guifg=#8f8c8c ctermfg=249

" 弹窗颜色
highlight Pmenu       guifg=#DCDCDC guibg=#666677 ctermfg=LightGrey ctermbg=DarkGrey

" 弹窗选中的颜色
highlight PmenuSel    guibg=#DB3227 ctermbg=red

" 弹窗滚动条颜色
highlight PmenuSbar   guibg=#5c5c5c  ctermbg=Gray

" 弹窗滚动条块颜色
highlight PmenuThumb  guibg=#DC9839 ctermbg=DarkGray

" 设置光标行高量
set cursorline
" 设置光标行颜色
highlight CursorLine guibg=#6a6c6b ctermbg=213 guifg=NONE ctermfg=NONE

" 淡化，弱化颜色，用于不需要突出显示的部分，比如未使用的变量
highlight CocFadeOut guifg=#ADADAA ctermfg=247 gui=bold

