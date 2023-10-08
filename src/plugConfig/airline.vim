" https://github.com/vim-airline/vim-airline

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

" 是否开启tab标签， 默认disabled
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'

" tab 标签显示格式： default | jsformatter | unique_tail | unique_tail_improved
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" let g:airline_inactive_collapse = 1

let g:airline_section_c_only_filename = 1
let g:airline_stl_path_style = 'short'

let g:airline_section_y = airline#section#create_right(['ffenc','foo'])

