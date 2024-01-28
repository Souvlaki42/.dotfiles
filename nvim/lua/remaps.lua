local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)

map({ "n", "v" }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make executable" })

-- Move line(s) up and down
map("n", "<A-j>", ":m .-2<CR>==", {desc="Move line up"})
map("n", "<A-k>", ":m .+1<CR>==", {desc="Move line down"})
map("v", "<A-j>", ":m '<-2<CR>gv=gv", {desc="Move line up"})
map("v", "<A-k>", ":m '>+1<CR>gv=gv", {desc="Move line down"})

-- Yank/Copy into system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank motion" })
map({ "n", "v" }, "<leader>Y", '"+Y', { desc = "Yank line" })

-- Delete/Cut into system clipboard
map({ "n", "v" }, "<leader>d", '"+d', { desc = "Delete motion" })
map({ "n", "v" }, "<leader>D", '"+D', { desc = "Delete line" })

-- Paste from system clipboard
map("n", "<leader>p", '"+p', { desc = "Paste after cursor" })
map("n", "<leader>P", '"+P', { desc = "Paste before cursor" })

-- normal mode u to undo
-- normal mode <C-r> to redo
