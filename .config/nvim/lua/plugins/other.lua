return {
	{ "rust-lang/rust.vim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "nvim-pack/nvim-spectre" },
  { "mg979/vim-visual-multi" },
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},
	{
		"Wansmer/treesj",
		keys = {
			{
				"<leader>tj",
				":TSJToggle<CR>",
				desc = "Toggle treesitter join",
			},
		},
		cmd = { "TSJToggle", "TSJSplit", "TSJoin" },
		opts = { use_default_keymaps = false },
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({ use_diagnostic_signs = true })
			vim.keymap.set("n", "<leader>tb", ":TroubleToggle<CR>")
		end,
	},
}
