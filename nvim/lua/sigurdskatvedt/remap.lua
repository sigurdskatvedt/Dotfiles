-- Space is leader
vim.g.mapleader = " "

-- Remap to fit to fit with Norwegian keyboard
vim.keymap.set("n", "ø", "l")
vim.keymap.set("n", "l", "k")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "j", "h")
vim.keymap.set("v", "ø", "l")
vim.keymap.set("v", "l", "k")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "j", "h")

-- Highlighted rows can be moved with K and J
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

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
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

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
vim.keymap.set("n","<leader>u", vim.cmd.UndotreeToggle)

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

-- NVIM-TREE.LUA
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>N", ":NvimTreeFindFile<CR>")

