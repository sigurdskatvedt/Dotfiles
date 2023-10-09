local nvim_tree = require 'nvim-tree'
local nvim_tree_view = require('nvim-tree.view')
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

nvim_tree.setup({
  hijack_cursor = true,
  update_focused_file = {
    enable = true,
  },
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
    nvim_tree_view.View.winopts.relativenumber = true

    vim.keymap.set("n", "ga", git_add, opts("Git add"))
  end,
  view = {
    width = 30,
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
