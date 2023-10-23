let g:indentLine_color_term = 243
let g:indentLine_char = '┊'

" 设置json时不显示缩进线
autocmd FileType json,markdown let g:indentLine_conceallevel=0
autocmd FileType javascript,python,c,cpp,java,vim,shell let g:indentLine_conceallevel=2

