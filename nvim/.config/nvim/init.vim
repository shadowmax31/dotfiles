let base_path = stdpath('config')

exec "source " . base_path . "/settings/set.vim"
exec "source " . base_path . "/settings/map.vim"
exec "source " . base_path . "/settings/plug.vim"
exec "source " . base_path . "/settings/run_sql.vim"

exec "source " . base_path . "/settings/plug/wiki.vim"
exec "source " . base_path . "/settings/plug/nerd.vim"
exec "source " . base_path . "/settings/plug/light_line.vim"
exec "source " . base_path . "/settings/plug/sneak.vim"
exec "source " . base_path . "/settings/plug/rainbow.vim"
exec "source " . base_path . "/settings/plug/startify.vim"
exec "source " . base_path . "/settings/plug/nuuid.vim"
exec "source " . base_path . "/settings/plug/vimspector.vim"
exec "source " . base_path . "/settings/plug/yank_highlight.vim"

" exec "luafile " . base_path . "/settings/plug/tree.lua"
exec "luafile " . base_path . "/settings/plug/telescope.lua"

" reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


color tokyonight-storm

" Transparent - As to be after color scheme
highlight Normal guibg=none
highlight NonText guibg=none

