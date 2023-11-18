
-- Remap to fit to fit with Norwegian keyboard
vim.keymap.set("n", "ø", "l")
vim.keymap.set("n", "l", "k")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "j", "h")
vim.keymap.set("v", "ø", "l")
vim.keymap.set("v", "l", "k")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "j", "h")

-- Window movement remap for Norwegian keyboard
vim.keymap.set("n", "<C-w>ø", "<C-w>l")
vim.keymap.set("n", "<C-w>l", "<C-w>k")
vim.keymap.set("n", "<C-w>k", "<C-w>j")
vim.keymap.set("n", "<C-w>j", "<C-w>h")
vim.keymap.set("v", "<C-w>ø", "<C-w>l")
vim.keymap.set("v", "<C-w>l", "<C-w>k")
vim.keymap.set("v", "<C-w>k", "<C-w>j")
vim.keymap.set("v", "<C-w>j", "<C-w>h")


-- Highlighted rows can be moved with K and J
vim.keymap.set("v", "L", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")

-- Action of J keeps cursor at the same location
vim.keymap.set("n", "J", "mzJ`z")


-- Keeps cursor in the middle of the screen when using CTRL+d or CTRL+u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Search terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Leader+p pastes without over text without putting replaced text into buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Leader+y copies to system register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Removes Q
vim.keymap.set("n", "Q", "<nop>")

-- Leader+f formats buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Leader+s replaces the word your are on in the entire buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Leader+x makes current file exectuable (chmod)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- UNDOTREE --
-- Leader+U opens Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- HARPOON --
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-ø>", function() ui.nav_file(4) end)
vim.keymap.set("n", "<C-æ>", function() ui.nav_file(5) end)


-- FUGITIVE --
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- NVIM-TREE.LUA --
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>N", ":NvimTreeFindFile<CR>")


-- TROUBLE.NVIM --
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { silent = true, noremap = true }
)

-- TODO-COMMENTS --
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })


-- REFACTORING --
-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
  "v",
  "<leader>rr",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)

-- GIT-CONFLICT --
vim.keymap.set('n', '<leader>co', '<Plug>(git-conflict-ours)')
vim.keymap.set('n', '<leader>ct', '<Plug>(git-conflict-theirs)')
vim.keymap.set('n', '<leader>cb', '<Plug>(git-conflict-both)')
vim.keymap.set('n', '<leader>c0', '<Plug>(git-conflict-none)')
vim.keymap.set('n', '<leader>]x', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', '<leader>[x', '<Plug>(git-conflict-next-conflict)')

-- local function ZoteroCite()
--   local filetype = vim.bo.filetype
--   local format = filetype:match(".*tex") and "citep" or "pandoc"
--   local api_call = "http://127.0.0.1:23119/better-bibtex/cayw?format=" .. format .. "&brackets=1"
--   local handle = io.popen("curl -s " .. api_call)
--   local result = handle:read("*a")
--   handle:close()
--   return result
-- end
--
-- local ZoteroWrapper = ZoteroCite()
--
-- vim.keymap.set("n", "<leader>z", ZoteroWrapper)
