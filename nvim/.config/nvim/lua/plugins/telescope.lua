return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require('telescope.actions')
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-p>"] = false,
              ["<C-n>"] = false,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
              ["q"] = actions.send_selected_to_qflist,
              ["Q"] = actions.send_to_qflist,
            }
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      telescope.load_extension("ui-select")
      telescope.load_extension("fzf")
      telescope.load_extension("neoclip")
      telescope.load_extension("live_grep_args")

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', 'gh', builtin.resume, { desc = '[gh] Open the last search' })
      vim.keymap.set('n', '<leader>?', '<cmd>Telescope neoclip<CR>', { desc = '[?] Clipboard history' })
      vim.keymap.set('n', '<leader>d', builtin.buffers, { desc = '[d] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      vim.keymap.set('n', '<C-p>', function()
        local filename = vim.fn.expand('%:t')
        local ext = vim.fn.expand('%:e')

        if ext == 'md' and #filename == 7 then
          -- This is a bit stupid, but it should only match ZK files (X2xa.md)
          -- I can't think of a better way to identify ZK files...maybe with the
          -- base path. But this works
          vim.cmd('ZkNotes')
        else
          builtin.find_files({
            find_command = {
              'rg',
              '--files',
              '--hidden',
              '-g',
              '!.git',
            }
          })
        end
      end, { desc = '[S]earch [F]iles' })

      vim.keymap.set('n', '<leader>f', telescope.extensions.live_grep_args.live_grep_args,
        { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>a', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    end
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },

  {
    "AckslD/nvim-neoclip.lua",
    opts = {},
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
    },
  },

  'nvim-telescope/telescope-ui-select.nvim',
}
