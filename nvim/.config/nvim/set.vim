syntax on
filetype plugin on

let mapleader = ","

set ff=unix
set number
set ignorecase
set number relativenumber
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set hidden

set tabstop=4
set shiftwidth=2
set expandtab

set guifont=Fira\ Code:h12
set guioptions-=r
set guioptions-=L
set guioptions-=T
set guioptions-=m

set termguicolors

" Git commits
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn+=73

autocmd BufNewFile,BufRead *.sw set syntax=swayconfig

highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
