execute pathogen#infect()

" general settings
filetype plugin indent on
syntax enable

" vim color settings
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" vim wiki related settings
set nocompatible
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.vim/bin/generate-vimwiki-diary-template.py '%'
nnoremap <Leader>wdl vi]dviWp

" edit settings
set tabstop=4 shiftwidth=4 expandtab smarttab
