return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-p>"] = false,
            ["<C-n>"] = false,
            ["<C-j>"] = require('telescope.actions').move_selection_next,
            ["<C-k>"] = require('telescope.actions').move_selection_previous,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        }
      }
    },
    config = function()
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")

      local builtin = require('telescope.builtin')


      vim.keymap.set('n', 'gh', builtin.resume, { desc = '[ ] Open the last search' })
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader>d', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      vim.keymap.set('n', '<C-p>', function()
        builtin.find_files({
          find_command = {
            'rg',
            '--files',
            '--hidden',
            '-g',
            '!.git',
          }
        })
      end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>a', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    end
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
  'nvim-telescope/telescope-ui-select.nvim',
}
