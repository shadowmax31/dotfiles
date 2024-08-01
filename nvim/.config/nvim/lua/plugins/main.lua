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
    opts = {
      options = {
        icons_enabled = true,
        theme = 'dracula',
        component_separators = '|',
        section_separators = '',
      }
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
    opts = {
      width = 140,
    }
  },

  {
    "tpope/vim-dadbod",
    dependencies = { "kristijanhusak/vim-dadbod-ui", "kristijanhusak/vim-dadbod-completion" },
  },

  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      keymaps = {
        ["q"] = "actions.close",
        ["<C-c>"] = false,
        ["<BS>"] = "actions.parent",
      }
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } }
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
