return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'folke/noice.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'dracula',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {},
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
          }
        },
      },
    }
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {
      scope = {
        show_start = false,
        show_end = false,
      }
    }
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = 'gc',
        block = 'gb',
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      extra = {
        above = 'gco',
        below = 'gco',
        eol = 'gca',
      },
      mappings = {
        basic = true,
        extra = false,
      },
      pre_hook = nil,
      post_hook = nil,
    }
  },

  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').create_default_mappings()
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    opts = {
      'css',
      'sass',
      'scss',
    }
  },

  { 'windwp/nvim-ts-autotag', opts = {} },

  {
    'mhartington/formatter.nvim',
    opts = {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        java = {
          function()
            return {
              exe = "clang-format",
              args = { "--assume-filename=.java" },
              stdin = true
            }
          end
        },
      }
    }
  },

  {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    config = function()
      require('no-neck-pain').setup({
        width = 140,
      })

      require('no-neck-pain').toggle()
    end,
  },

  {
    "tpope/vim-dadbod",
    dependencies = {
      { "kristijanhusak/vim-dadbod-ui",         lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_execute_on_save = 0
      vim.keymap.set({ 'n', 'v' }, '<leader>i', '<Plug>(DBUI_ExecuteQuery)')
      vim.keymap.set('n', '<leader>X', function()
        vim.cmd(':DBUIToggle')
      end)
    end,
  },

  {
    'stevearc/oil.nvim',
    opts = {
    },
    config = function()
      require('oil').setup({
        default_file_explorer = true,
        delete_to_trash = true,
        keymaps = {
          ["q"] = "actions.close",
          ["<C-c>"] = false,
          ["<BS>"] = "actions.parent",
        }
      })

      vim.keymap.set('n', '<C-n>', ':Oil<CR>')
    end,
    dependencies = { { "echasnovski/mini.icons", opts = {} } }
  },

  {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup({
        backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
      })

      vim.keymap.set("n", "<leader>s", "<cmd>AerialToggle float<CR>")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },

  {
    'vim-test/vim-test',
    dependencies = {
      'preservim/vimux'
    },
    config = function()
      vim.g["test#strategy"] = "vimux"
      vim.g["VimuxHeight"] = "20"
      vim.g["VimuxUseNearest"] = 0

      vim.keymap.set("n", "<leader>u", "<cmd>TestNearest<CR>")
      vim.keymap.set("n", "<leader>U", "<cmd>TestFile<CR>")
    end
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      render_modes = { 'n', 'v', 'V', 'i', 'c' }
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }
  },

  'dracula/vim',
  'gregsexton/MatchTag',
  'airblade/vim-rooter',
  'jiangmiao/auto-pairs',
  'christoomey/vim-tmux-navigator',
  'pest-parser/pest.vim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
}
