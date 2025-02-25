" emmet 插件
" https://github.com/mattn/emmet-vim

let g:user_emmet_install_global = 1
autocmd FileType html,css,js,vue,jsx,javascript,typescriptreact,php,tsx EmmetInstall
let g:user_emmet_mode='a'  " 在所有模式下开启
let g:user_emmet_leader_key='<C-E>'

