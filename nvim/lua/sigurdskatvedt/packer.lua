-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }


    use({ 'rose-pine/neovim', as = 'rose-pine' })
    vim.cmd('colorscheme rose-pine')

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            local api = require("nvim-tree.api")
            local lib = require("nvim-tree.lib")


            local git_add = function()
                local node = lib.get_node_at_cursor()

                if node then
                    local gs = node.git_status.file

                    -- If the file is untracked, unstaged or partially staged, we stage it
                    if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
                        vim.cmd("silent !git add " .. node.absolute_path)

                        -- If the file is staged, we unstage
                    elseif gs == "M " or gs == "A " then
                        vim.cmd("silent !git restore --staged " .. node.absolute_path)
                    end

                    api.tree.reload()
                end
            end

            require("nvim-tree").setup({
                hijack_cursor = true,
                sync_root_with_cwd = true,
                on_attach = function(bufnr)
                    local function opts(desc)
                        return {
                            desc = "nvim-tree: " .. desc,
                            buffer = bufnr,
                            noremap = true,
                            silent = true,
                            nowait = true,
                        }
                    end
                    -- Apply default mappings first
                    api.config.mappings.default_on_attach(bufnr)

                    vim.keymap.set("n", "ga", git_add, opts("Git add"))
                end,
                view = {
                    width = 40,
                    preserve_window_proportions = true,
                    -- mappings = {
                    --   list = {
                    --     { key = "cd", action = "cd" },
                    --     { key = "ga", action = "git_add", action_cb = git_add },
                    --     { key = "gd", action = "git_rm", action_cb = git_rm },
                    --     { key = "<Leader>d", action = "debug", action_cb = debug },
                    --   },
                    -- },
                },
                filters = {},
            })
        end

    }
end)
