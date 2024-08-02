return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { 'c', 'cpp', 'lua', 'rust', 'typescript', 'vimdoc', 'vim', 'java', 'scss', 'bash', 'html' },
        auto_install = true,
        indent = { enable = true, disable = { 'python' } },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },
}

