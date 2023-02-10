"load pathogen managed plugins
call pathogen#infect()
call pathogen#helptags()

" general settings
filetype plugin indent on
syntax enable

" vim color settings
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" vim wiki related settings
set nocompatible
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.config/nvim/bin/generate-vimwiki-diary-template.py '%'

" edit settings
set tabstop=4 shiftwidth=4 expandtab autoindent
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
