return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			},
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")

			telescope.setup({
				extensions = {
					["ui-select"] = {
						themes.get_dropdown({}),
					},
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("fzf")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>ol", builtin.oldfiles, { desc = "Old files" })
			vim.keymap.set("n", "<leader>man", builtin.man_pages, { desc = "Man pages" })
			vim.keymap.set("n", "<leader>key", builtin.keymaps, { desc = "Keymaps (N)" })
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
		end,
	},
}
