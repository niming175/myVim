" codedium 代码AI 补全插件 
" https://github.com/JohnRigoni/codeium.vim
let g:codeium_enabled = v:true

" 禁用默认快捷键
let g:codeium_no_map_tab = 1

let g:codeium_os = "Linux"

" 接受补全提示
imap <script><silent><nowait><expr> <C-J> codeium#Accept()

" 接受补全下个单词
imap <script><silent><nowait><expr> <C-l> codeium#AcceptNextWord()
" 接受补全下一行
imap <script><silent><nowait><expr> <C-L> codeium#AcceptNextLine()
" 下一个建议
imap <script><silent><nowait><expr> <C-n> codeium#CycleCompletions(1)
" 上一个建议
imap <script><silent><nowait><expr> <C-p> codeium#CycleCompletions(-1)
" 取消当前的提示
imap <script><silent><nowait><expr> <C-k> codeium#Clear()

