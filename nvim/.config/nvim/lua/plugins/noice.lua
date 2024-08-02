return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = true,
        format = {
          conceal = false,
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim", "rcarriga/nvim-notify",
    }
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        stages = "static",
      })
      vim.notify = require("notify")
      vim.keymap.set('n', '<leader>cc', '<cmd>NoiceDismiss<CR>')
    end,
  }
}
