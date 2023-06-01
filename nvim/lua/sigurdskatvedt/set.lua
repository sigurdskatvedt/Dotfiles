-- Display number and use relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab width of 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- Use spaces instead of tab
vim.opt.expandtab = true

-- Smart indentation, match the previous indentation or add/remove in 
-- certain cases
vim.opt.smartindent = true

-- Store undo in directory instead of swapfile to enable undos from previous 
-- session
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Show matching search pattern in realtime
vim.opt.incsearch = true

-- Use 24-bit RGB color in the terminal
vim.opt.termguicolors = true

-- Keeps the cursor 8 spaces from the top or bottom edges, starts scrolling
vim.opt.scrolloff = 8
-- Keeps the sign column always enabled. Shows things like LSP or linting
-- errors
vim.opt.signcolumn = "yes"
-- Include filenames with special characters
vim.opt.isfname:append("@-@")

-- Vertical column at the 80th character to help keep lines short
vim.opt.colorcolumn = "80"
