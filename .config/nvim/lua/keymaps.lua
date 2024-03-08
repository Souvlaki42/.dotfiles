-- Find and replace
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

-- Make script executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make script executable" })

-- Move line(s) up and down
vim.keymap.set("n", "<A-j>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-k>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("v", "<A-j>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Yank/Copy into system clipboard
vim.keymap.set("n", "<leader>y", '"+Y', { desc = "Yank line" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank motion" })

-- Delete/Cut into system clipboard
vim.keymap.set("n", "<leader>d", '"+D', { desc = "Delete line" })
vim.keymap.set("v", "<leader>d", '"+d', { desc = "Delete motion" })

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+P', { desc = "Paste line" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste motion" })

-- Undo and redo
vim.keymap.set("n", "u", ":undo<CR>", { desc = "Undo" })
vim.keymap.set("n", "r", ":redo<CR>", { desc = "Redo" })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true })
