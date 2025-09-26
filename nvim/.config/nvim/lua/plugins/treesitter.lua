return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'antoinephilibert/tree-sitter-w'
    },
    build = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { 'c', 'cpp', 'lua', 'rust', 'typescript', 'vimdoc', 'vim', 'java', 'scss', 'bash', 'html', 'markdown', 'yaml', 'w' },
        auto_install = true,
        indent = { enable = true, disable = { 'python' } },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },

  {
    'antoinephilibert/tree-sitter-w',
    config = function()
      require('nvim-treesitter.parsers').get_parser_configs().w = {
        install_info = {
          url = 'https://github.com/antoinephilibert/tree-sitter-w',
          files = { 'src/parser.c' },
          branch = 'master'
        },
        filetype = 'wengine',
      }
    end
  }
}
