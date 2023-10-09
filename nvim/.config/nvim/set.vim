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

" Force line return when reaching limit
autocmd FileType gitcommit set textwidth=80

set colorcolumn+=81
let g:goyo_width = 120
let g:goyo_height = "100%"

autocmd BufNewFile,BufRead *.sw set syntax=swayconfig
autocmd BufNewFile,BufRead *.hbs set syntax=html

" MarkdownPreview
let g:mkdp_auto_start = 1
let g:mkdp_browser = 'librewolf'
let g:mkdp_theme = 'dark'
let g:mkdp_preview_options = {
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'relative',
    \ }

" Color scheme

"" This callback is mainly here because of goyo
autocmd! ColorScheme * call s:set_transparent_bg()
function! s:set_transparent_bg()
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none

    set termguicolors
endfunction

colorscheme dracula
