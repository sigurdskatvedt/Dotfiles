local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local actionspreview = require("actions-preview")

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, "<leader>vrn", '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ "n", "x" }, "<leader>vca", actionspreview.code_actions)
    vim.keymap.set('n', '<leader>vrr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', '<C-f>', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
    vim.keymap.set('n', '<C-+>"', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  end
})

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })

  lspconfig['pylsp'].setup {
    on_attach = custom_attach,
    settings = {
      pylsp = {
        plugins = {
          -- Completions and renaming
          rope = { enabled = true },
          -- formatter options
          autopep8 = { enabled = false },
          yapf = { enabled = true },
          -- linter options
          pylint = { enabled = true, executable = "pylint" },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = true },
          -- import sorting
          pyls_isort = { enabled = false },
          -- complexity checking
          mccabe = { enabled = true },
          -- type checker
          pylsp_mypy = { enabled = true,
            live_mode = true,
          },
        },
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
  }

  lspconfig.tsserver.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      completions = {
        completeFunctionCalls = true
      }
    }
  }

  lspconfig['ltex'].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
    settings = {
      ltex = {
        language = { "en-GB" }
        --disabledRules = { ['en-US'] = { 'PROFANITY' } },
      },
    },
  }
end

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = { default_setup },
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter key confirms completion item
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
