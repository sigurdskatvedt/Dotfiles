-- Leader needs to be set for lazy
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy").setup({
  {
    {
      'nvim-telescope/telescope.nvim',
      version = '0.1.1'
      ,
      dependencies = {
        'nvim-lua/plenary.nvim' }
    },
    { 'rose-pine/neovim',                    name = 'rose-pine', },
    { 'nvim-treesitter/nvim-treesitter',     build = ':TSUpdate', },
    { 'nvim-treesitter/playground', },
    { 'theprimeagen/harpoon', },
    { 'mbbill/undotree', },
    { 'tpope/vim-fugitive', },
    { 'f-person/git-blame.nvim', },
    { 'MunifTanjim/prettier.nvim', },
    { 'lewis6991/gitsigns.nvim', },
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', },
    { 'folke/todo-comments.nvim', },
    { 'xiyaowong/transparent.nvim', },
    { 'barrett-ruth/import-cost.nvim', },
    {
      'nvim-neorg/neorg',
      build = ':Neorg sync-parsers'
      ,
      dependencies =
      'nvim-lua/plenary.nvim'
    },
    { 'nvim-neorg/neorg-telescope', },
    { 'kylechui/nvim-surround',     version = '*', },
    { 'akinsho/git-conflict.nvim',  version = '*', },
    { 'numToStr/Comment.nvim', },
    { 'Wansmer/treesj',             dependencies = 'nvim-treesitter' },
    {
      'ThePrimeagen/refactoring.nvim'
      ,
      dependencies = { 'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter' }
    },
    { 'klen/nvim-test', },
    { 'folke/trouble.nvim',                dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'folke/flash.nvim' },
    { "williamboman/mason.nvim" },
    { 'williamboman/mason-lspconfig.nvim', },
    { 'neovim/nvim-lspconfig', },
    {
      'nvim-tree/nvim-tree.lua'
      ,
      dependencies =
      'nvim-tree/nvim-web-devicons'
    },
    { 'zbirenbaum/copilot.lua', },
    { 'zbirenbaum/copilot-cmp', dependencies = { 'copilot.lua' }, },
    {
      'jackMort/ChatGPT.nvim',
      dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim' },

    },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp"
    },

  }
})
