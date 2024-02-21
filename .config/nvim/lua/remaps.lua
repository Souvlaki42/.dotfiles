-- "Include" keymap set function
local map = vim.keymap.set

-- Find and replace
map({ "n", "v" }, "<leader>su", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make script executable
map("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make executable" })

-- Move line(s) up and down
map("n", "<A-j>", ":m .-2<CR>==", { desc = "Move line up" })
map("n", "<A-k>", ":m .+1<CR>==", { desc = "Move line down" })
map("v", "<A-j>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("v", "<A-k>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Yank/Copy into system clipboard
map("n", "<C-c>", '"+Y', { desc = "Yank line" })
map("v", "<C-c>", '"+y', { desc = "Yank motion" })

-- Delete/Cut into system clipboard
map("n", "<C-x>", '"+D', { desc = "Delete line" })
map("v", "<C-x>", '"+d', { desc = "Delete motion" })

-- Paste from system clipboard
map("n", "<C-v>", '"+P', { desc = "Paste line" })
map("v", "<C-v>", '"+p', { desc = "Paste motion" })

-- Undo and redo
map("n", "u", ":undo<CR>", { desc = "Undo" })
map("n", "r", ":redo<CR>", { desc = "Redo" })

-- Select all
map("n", "<C-a>", "ggVG", { noremap = true })
