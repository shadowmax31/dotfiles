return function(use)
  use({
    'dracula/vim',
    'folke/tokyonight.nvim',
    'kien/rainbow_parentheses.vim',
    'ggandor/leap.nvim',
    'gregsexton/MatchTag',
    'airblade/vim-rooter',
    'jiangmiao/auto-pairs',
    'nvim-telescope/telescope-file-browser.nvim',
    'ThePrimeagen/harpoon',
    'christoomey/vim-tmux-navigator',
    'norcalli/nvim-colorizer.lua',
    'windwp/nvim-ts-autotag',
    'pest-parser/pest.vim',
    'mhartington/formatter.nvim',
    'David-Kunz/gen.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'shortcuts/no-neck-pain.nvim', tag = '*' },
    { 'iamcco/markdown-preview.nvim', run = function() vim.fn["mkdp#util#install"]() end },
    {
          "tpope/vim-dadbod",
          requires = {
           "kristijanhusak/vim-dadbod-ui",
           "kristijanhusak/vim-dadbod-completion"
          },
    }
  })
end
