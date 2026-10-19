" https://github.com/vim-airline/vim-airline

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

" 是否开启tab标签， 默认disabled
let g:airline#extensions#tabline#enabled = 1

" 开启顶部 buffer 序号显示
let g:airline#extensions#tabline#buffer_idx_mode = 1

" 关闭右上角多余的 buffers/tabs 模式标签
let g:airline#extensions#tabline#show_tab_type = 0

" 空格 + 数字 (1~9) 快速跳转到顶部对应编号的页面
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0

let g:airline#extensions#tabline#left_sep = ''   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#tabline#show_close_button = 1 " 显示关闭按钮
let g:airline#extensions#tabline#close_symbol = 'X' " x表示关闭按钮
" let g:airline_left_sep='>' " 左侧使用隔离符号
" let g:airline_right_sep='<' " 右侧使用隔离符号

let g:airline#extensions#tabline#left_alt_sep = '|'

" tab 标签显示格式： default | jsformatter | unique_tail | unique_tail_improved
let g:airline#extensions#tabline#formatter = 'default'

" let g:airline_inactive_collapse = 1

" let g:airline_section_c_only_filename = 1
let g:airline_stl_path_style = 'short'

let g:airline_section_y = airline#section#create_right(['ffenc','foo'])

" 未保存的 buffer 标题后添加 * 符号
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.modified = ' *'

" 自定义 tabline 配色：
" 激活项：浅灰背景 (#c0c0c0)，深灰字体 (#303030)
" 未激活项：保持当前灰色背景 (#465457)，白色字体 (#f8f8f0)
function! AirlineThemePatch(palette)
  let tab_active = [ '#303030', '#c0c0c0', 236, 250, 'underline' ]
  let tab_inactive = [ '#f8f8f0', '#465457', 253, 67, 'underline' ]
  let tab_fill = [ '#f8f8f0', '#465457', 253, 67, 'underline' ]

  if !has_key(a:palette, 'tabline')
    let a:palette.tabline = {}
  endif

  " 激活状态（包括已保存与未保存）
  let a:palette.tabline.airline_tabsel = tab_active
  let a:palette.tabline.airline_tabmod = tab_active
  let a:palette.tabline.airline_tabsel_right = tab_active
  let a:palette.tabline.airline_tabmod_right = tab_active

  " 未激活状态（包括已保存与未保存）
  let a:palette.tabline.airline_tab = tab_inactive
  let a:palette.tabline.airline_tabhid = tab_inactive
  let a:palette.tabline.airline_tabmod_unsel = tab_inactive
  let a:palette.tabline.airline_tab_right = tab_inactive
  let a:palette.tabline.airline_tabhid_right = tab_inactive
  let a:palette.tabline.airline_tabmod_unsel_right = tab_inactive

  " 右侧空白区域也带上下划线，保持整行贯通
  let a:palette.tabline.airline_tabfill = tab_fill
endfunction
let g:airline_theme_patch_func = 'AirlineThemePatch'

