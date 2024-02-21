return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
				{
					"nvim-telescope/telescope-live-grep-args.nvim",
					-- This will not install any breaking changes.
					-- For major updates, this must be adjusted manually.
					version = "^1.0.0",
				},
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
      telescope.load_extension("live_grep_args")
      telescope.load_extension("fzf")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set(
				"n",
				"<leader>fg",
				"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
				{ desc = "Live Grep" }
			)
			vim.keymap.set(
				"n",
				"<leader>fc",
				'<cmd>lua require("telescope.builtin").live_grep({ glob_pattern = "!{spec,test}"})<CR>',
				{ desc = "Live Grep Code" }
			)
		end,
	},
}
