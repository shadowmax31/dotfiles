return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'mfussenegger/nvim-jdtls',
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,

    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
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
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
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

  { 'nvim-telescope/telescope.nvim',            branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },


  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make',   cond = vim.fn.executable 'make' == 1 },

  'dracula/vim',
  'folke/tokyonight.nvim',
  'kien/rainbow_parentheses.vim',
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').create_default_mappings()
    end
  },
  'gregsexton/MatchTag',
  'airblade/vim-rooter',
  'jiangmiao/auto-pairs',
  'nvim-telescope/telescope-file-browser.nvim',
  'ThePrimeagen/harpoon',
  'christoomey/vim-tmux-navigator',
  {
    'norcalli/nvim-colorizer.lua',
    opts = {
      'css',
      'sass',
      'scss',
    }
  },
  { 'windwp/nvim-ts-autotag', opts = {} },
  'pest-parser/pest.vim',
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
  'nvim-telescope/telescope-ui-select.nvim',
  {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    opts = {
      width = 140,
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "tpope/vim-dadbod",
    dependencies = { "kristijanhusak/vim-dadbod-ui", "kristijanhusak/vim-dadbod-completion" },
  }
}
