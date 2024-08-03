syntax on
filetype plugin on

let mapleader = ","

set mouse=
set ff=unix
set number
set nowrap
set ignorecase
set number relativenumber
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set hidden

set tabstop=2
set shiftwidth=2
set expandtab

set guifont=Fira\ Code:h12
set guioptions-=r
set guioptions-=L
set guioptions-=T
set guioptions-=m

let g:rustfmt_autosave = 1

" Force line return when reaching limit
autocmd FileType gitcommit set textwidth=80
autocmd FileType markdown set textwidth=80

set colorcolumn+=81

" Color scheme
autocmd! ColorScheme * call s:set_transparent_bg()
function! s:set_transparent_bg()
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
endfunction
colorscheme dracula

autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })

