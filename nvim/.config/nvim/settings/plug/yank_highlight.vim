if has('nvim-0.4')
  function! s:hl_yank(operator, regtype, inclusive) abort
    if a:operator !=# 'y' || a:regtype ==# ''
      return
    endif
    " edge cases:
    "   ^v[count]l ranges multiple lines

    " TODO:
    "   bug: ^v where the cursor cannot go past EOL, so '] reports a lesser column.

    let bnr = bufnr('%')
    let ns = nvim_create_namespace('')
    call nvim_buf_clear_namespace(bnr, ns, 0, -1)

    let [_, lin1, col1, off1] = getpos("'[")
    let [lin1, col1] = [lin1 - 1, col1 - 1]
    let [_, lin2, col2, off2] = getpos("']")
    let [lin2, col2] = [lin2 - 1, col2 - (a:inclusive ? 0 : 1)]
    for l in range(lin1, lin1 + (lin2 - lin1))
      let is_first = (l == lin1)
      let is_last = (l == lin2)
      let c1 = is_first || a:regtype[0] ==# "\<C-v>" ? (col1 + off1) : 0
      let c2 = is_last || a:regtype[0] ==# "\<C-v>" ? (col2 + off2) : -1
      call nvim_buf_add_highlight(bnr, ns, 'TextYank', l, c1, c2)
    endfor
    call timer_start(300, {-> nvim_buf_is_valid(bnr) && nvim_buf_clear_namespace(bnr, ns, 0, -1)})
  endfunc
  highlight default link TextYank Visual
  augroup vimrc_hlyank
    autocmd!
    autocmd TextYankPost * call s:hl_yank(v:event.operator, v:event.regtype, v:event.inclusive)
  augroup END
endif

if has("nvim-0.5")
  augroup yank_highlight
    autocmd!
    if exists('##TextYankPost')
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    endif
  augroup END
endif
