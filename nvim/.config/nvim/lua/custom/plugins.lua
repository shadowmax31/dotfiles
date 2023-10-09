return function(use)
  use({
    'dracula/vim',
    'folke/tokyonight.nvim',
    'kien/rainbow_parentheses.vim',
    'justinmk/vim-sneak',
    'ap/vim-buftabline',
    'gregsexton/MatchTag',
    'airblade/vim-rooter',
    'jiangmiao/auto-pairs',
    'junegunn/goyo.vim',
    'nvim-telescope/telescope-file-browser.nvim',
    'ThePrimeagen/harpoon',
    'christoomey/vim-tmux-navigator',
    'norcalli/nvim-colorizer.lua',
    { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end }
  })
end
