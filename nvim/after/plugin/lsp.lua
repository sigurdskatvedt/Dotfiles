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
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set({ "n", "x" }, "<F4>", actionspreview.code_actions)

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  end
})

local on_attach = function(client, bufnr)
  -- Example: Setting up buffer-local key mappings
  -- This part is optional and can be omitted if you don't need specific LSP-related key mappings
end

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })

  lspconfig['pylsp'].setup {
    on_attach = on_attach, -- Attach your on_attach function if needed
    filetypes = { 'python' },
    settings = {
      configurationSources = { "flake8" },
      formatCommand = { "black" },
      pylsp = {
        plugins = {
          jedi_completion = { include_params = true },
          jedi_signature_help = { enabled = true },
          jedi = {
            extra_paths = { '~/projects/work_odoo/odoo14', '~/projects/work_odoo/odoo14' },
          },
          pyflakes = { enabled = true },
          pycodestyle = {
            enabled = true,
            maxLineLength = 120
          },
          yapf = { enabled = true }
        }
      }
    }
  }
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "jedi_language_server" },
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
