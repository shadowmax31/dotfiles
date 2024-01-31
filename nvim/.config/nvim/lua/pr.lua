vim.filetype.add({
  extension = { w = "wengine" }
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "wengine",
  callback = function()
    local p = vim.loop.cwd()

    vim.lsp.start({
      name = "mylsp",
      cmd = { p .. "/target/debug/lsp-w" },
      capabilites = vim.lsp.protocol.make_client_capabilities(),
      root_dir = p,
    })
  end
})
