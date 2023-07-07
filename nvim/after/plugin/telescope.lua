local telescope = require('telescope')
telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "yarn.lock"
    }
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep)
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

-- load refactoring Telescope extension
telescope.load_extension("refactoring")
