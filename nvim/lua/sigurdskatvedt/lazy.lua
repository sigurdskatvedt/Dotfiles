-- Leader needs to be set for lazy
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy").setup({
  {
    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim' }
    },
    { 'morhetz/gruvbox',                     name = 'gruvbox', },
    { 'mofiqul/dracula.nvim',                name = 'dracula', },
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
    { 'mfussenegger/nvim-dap' },
    { 'xiyaowong/transparent.nvim', },
    { 'barrett-ruth/import-cost.nvim', },
    { 'kylechui/nvim-surround',              version = '*', },
    { 'akinsho/git-conflict.nvim',           version = '*', },
    { 'numToStr/Comment.nvim', },
    { 'Wansmer/treesj',                      dependencies = 'nvim-treesitter' },
    {
      'ThePrimeagen/refactoring.nvim'
      ,
      dependencies = { 'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter' }
    },
    { 'klen/nvim-test', },
    { 'folke/trouble.nvim',                dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'folke/flash.nvim' },
    { "gbprod/yanky.nvim", },
    { "williamboman/mason.nvim" },
    { 'williamboman/mason-lspconfig.nvim', },
    { 'neovim/nvim-lspconfig', },
    { "aznhe21/actions-preview.nvim" },
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
    {
      'mrcjkb/rustaceanvim',
      version = '^4', -- Recommended
      lazy = false, -- This plugin is already lazy
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp"
    },

    -- {
    --   "epwalsh/obsidian.nvim",
    --   version = "*", -- recommended, use latest release instead of latest commit
    --   lazy = true,
    --   ft = "markdown",
    --   dependencies = {
    --     -- Required.
    --     "nvim-lua/plenary.nvim",
    --
    --     -- see below for full list of optional dependencies 👇
    --   },
    --   opts = {
    --     workspaces = {
    --       {
    --         name = "personal",
    --         path = "~/vaults/personal",
    --       },
    --       {
    --         name = "work",
    --         path = "~/vaults/work",
    --       },
    --     },
    --
    --     -- see below for full list of options 👇
    --   },
    -- }
  }
})
