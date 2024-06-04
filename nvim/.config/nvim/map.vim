" Permet de faire fonctionner le mode normal avec le clavier français
nmap é /
nmap È "
nmap è '

nnoremap <M-j> :resize -3<CR>
nnoremap <M-k> :resize +3<CR>
nnoremap <M-h> :vertical resize -3<CR>
nnoremap <M-l> :vertical resize +3<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-w>j <nop>
nnoremap <C-w>k <nop>
nnoremap <C-w>h <nop>
nnoremap <C-w>l <nop>

noremap <Leader>i <Plug>(DBUI_ExecuteQuery)
noremap <Leader>X :DBUIToggle<CR>

noremap <Leader>y "+y
noremap <Leader>Y "+Y
noremap <Leader>p "+p
noremap <Leader>P "+P

noremap Y yy

nnoremap <Leader><Backspace> :bd<CR>

nnoremap <Leader>w :NoNeckPain<CR>

nnoremap QQ :qa<CR>

nnoremap git<space> :Git 

nnoremap <silent> <leader>e :Format<CR>
