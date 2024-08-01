return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'c', 'cpp', 'lua', 'rust', 'typescript', 'vimdoc', 'vim', 'java', 'scss', 'bash', 'html' },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true, disable = { 'python' } },
    },
    config = function()
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },
}

