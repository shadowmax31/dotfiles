local M = {}

function M.setup(options)
  vim.filetype.add({
    extension = { w = "wengine" }
  })


  vim.api.nvim_create_autocmd("FileType", {
    pattern = "wengine",
    callback = function()
      local p = vim.loop.cwd()

      vim.lsp.start({
        name = "wlsp",
        cmd = { "pw", "lsp" },
        -- cmd = { p .. "/target/debug/pw", "lsp" },
        capabilites = vim.lsp.protocol.make_client_capabilities(),
        on_attach = options.on_attach,
        root_dir = p,
      })
    end
  })
end

return M
