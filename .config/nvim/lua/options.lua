-- Aliases for vim APIs
local opt = vim.opt
local g = vim.g
local keymap = vim.keymap
local user_command = vim.api.nvim_create_user_command

-- Leader and explorer maps
g.mapleader = " "
g.maplocalleader = "\\"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Remove carriage returns (\r) at the end of lines
vim.keymap.set("n", "<leader>cr", function()
	vim.cmd([[:%s/\r$//]])
end, { desc = "Remove carriage returns at the end of lines" })

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- Indenting
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- GUI Cursor
opt.guicursor = ""

-- Line numbers
opt.nu = true
opt.relativenumber = true

-- Smart indenting and wrapping
opt.smartindent = true
opt.wrap = false

-- Undo tree location and backups
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Highlighting on search
opt.hlsearch = false
opt.incsearch = true

-- Colors
opt.termguicolors = true

-- Scrolloff and stuff
opt.scrolloff = 8
opt.updatetime = 50

-- Automatically convert line endings
opt.fileformat = "unix"

-- Re-open at last position
vim.cmd [[ au BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

-- Keymaps for moving lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Alias uppercase W to lowercase w
user_command("W", "w", {})
user_command("Wq", "wq", {})
user_command("Wa", "wa", {})
user_command("Wq", "wq", {})
user_command("Wa", "wa", {})

-- Dismiss Noice Messages
keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Messages" })

-- Half page jumping keymaps
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Search terms in middle keymaps
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Replace without losing paste buffer keymap
keymap.set("x", "<leader>p", '"_dP')

-- Yanking effectively
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')
keymap.set("n", "<leader>D", '"_D')

-- Quickfix list navigation
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Find and replace
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Make file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
