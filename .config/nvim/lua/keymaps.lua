local map = vim.keymap.set

-- Find and replace
map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

-- Make script executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make script executable" })

-- Move line(s) up and down
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Yank/Copy into system clipboard
map("n", "<leader>y", '"+Y', { desc = "Yank line" })
map("v", "<leader>y", '"+y', { desc = "Yank motion" })

-- Paste from system clipboard
map("n", "<leader>p", '"+P', { desc = "Paste line" })
map("v", "<leader>p", '"+p', { desc = "Paste motion" })

-- Undo and redo
map("n", "u", ":undo<CR>", { desc = "Undo" })
map("n", "r", ":redo<CR>", { desc = "Redo" })

-- Select all
map("n", "<C-a>", "ggVG", { noremap = true })
