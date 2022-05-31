execute pathogen#infect()

" general settings
filetype plugin indent on
syntax enable

" vim color settings
set background=dark
colorscheme solarized8

" vim wiki related settings
set nocompatible
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.vim/bin/generate-vimwiki-diary-template.py '%'
nnoremap <Leader>wdl vi]dviWp

" edit settings
set tabstop=4 shiftwidth=4 expandtab smarttab
set nowrap
set pastetoggle=<F2>
inoremap <C-[> <C-c>
inoremap <C-c> <C-[>
vnoremap <C-[> <C-c>
vnoremap <C-c> <C-[>

" plugin related
let g:camelcasemotion_key = '<leader>'

" turn off gitgutter by default
let g:gitgutter_signs = 0
