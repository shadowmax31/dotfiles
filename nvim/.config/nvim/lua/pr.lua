
vim.filetype.add({
  extension = { w = "wengine" }
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "wengine",
  callback = function()
    local p = vim.loop.cwd()

    vim.lsp.start({
      name = "mylsp",
      cmd = { "pw", "lsp" },
      -- cmd = { p .. "/target/debug/pw", "lsp" },
      capabilites = vim.lsp.protocol.make_client_capabilities(),
      root_dir = p,
    })
  end
})
